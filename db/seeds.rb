CLASSIFICATION_FILE = 'db/category_seeding/Subsection_Classifications.csv'



# THIS is not used currently - needs to be altered to get all executive data
def seed_executives_table(org, doc)
  puts "method call"
  doc.search("Form990PartVIISectionAGrp").each do |person_element|
    puts person_element.elements[1].text
    # Executive.create(
    # organisation_id: org.id,
    # name: person_element.elements[0].text,
    # title: person_element.elements[1].text,
    # salary: person_element.elements[0].text

    # )
  end
end


#SEED SCRIPT
source_path = Rails.root.join('db', 'xml_files')

Dir.glob("#{source_path}/*.xml").each do |xml_file|

  file = File.open(xml_file)
  xml = File.read(file)
  doc = Nokogiri::XML(xml)
  leaves = doc.xpath('//*[not(*)]')

  hash = {}
  leaves.each do |node|
  hash["#{node.name}"] = node.text
  end

  org = Organisation.create(
    name: hash["BusinessNameLine1"],
    mission: hash["ActivityOrMissionDesc"],
    organisation_type: hash["TypeOfOrganizationCorpInd"],
    address: hash["AddressLine1"],
    city: hash["City"],
    state: hash["State"],
    zip: hash["ZIPCode"],
    year_formed: hash["FormationYr"],
    number_of_employees: hash["TotalEmployeeCnt"],
    domain: hash["WebsiteAddressTxt"]
  )

  Revenue.create(
   organisation_id: org.id,
   year: hash["TaxYr"],
   contributions: hash["CYContributionsGrantsAmt"],
   service_revenue: hash["CYProgramServiceRevenueAmt"],
   investments: hash["CYInvestmentIncomeAmt"],
   other: hash["CYTotalRevenueAmt"],
   total: hash["CYTotalRevenueAmt"]
   )

   Expense.create(
   organisation_id: org.id,
   year: hash["TaxYr"],
   grants: hash["CYGrantsAndSimilarPaidAmt"],
   member_benefits: hash["CYBenefitsPaidToMembersAmt"],
   salaries: hash["CYSalariesCompEmpBnftPaidAmt"],
   fundraising_fees: hash["CYTotalProfFndrsngExpnsAmt"],
   other: hash["CYOtherExpensesAmt"],
   total: hash["CYTotalExpensesAmt"]
   )

  Balance.create(
    organisation_id: org.id,
    year: hash["TaxYr"],
    total_assets: hash["TotalAssetsEOYAmt"],
    total_liabilities: hash["TotalLiabilitiesEOYAmt"],
    net_assets: hash["NetAssetsOrFundBalancesEOYAmt"]
    )

  Executive.create(
  organisation_id: org.id,
  name: hash["PersonNm"],
  title: hash["TitleTxt"],
  salary: hash["ReportableCompFromOrgAmt"],
   )

    # seed_executives_table(doc)
end


  # This is the runner data

  # puts hash["BusinessNameLine1"]
  # puts hash["ActivityOrMissionDesc"]
  # puts hash["AddressLine1"]
  # puts hash["City"]
  # puts hash["State"]
  # puts hash["ZIPCode"]
  # puts hash["TotalEmployeeCnt"]
  # puts hash["WebsiteAddressTxt"]



# Additional information we could add
  # puts hash["TypeOfOrganizationCorpInd"]




