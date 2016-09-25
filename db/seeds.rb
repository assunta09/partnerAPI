require 'csv'

#SEEDING of the classification file
classifications_csv = File.read(Rails.root.join('db', 'category_seeding', 'Subsections_Classifications.csv'))
# classification = CSV.parse(classifications_csv, headers: true, :col_sep => ";",:encoding => 'ISO-8859-1')
# classification.each do |line|
#   Classification.create(line.to_hash)
# end

#Seeding MASTERFILE
source_path_csv = Rails.root.join('db', 'category_seeding', 'regional_files')
Dir.glob("#{source_path_csv}/*.csv").each do |csv_file|
  masterfile_csv = File.read(csv_file)
  masterfile = CSV.parse(masterfile_csv, headers: true, :encoding => 'ISO-8859-1')
  masterfile.each do |line|
    m = Masterfile.new
    m.ein = line['EIN']
    m.subsection_code = line['SUBSECTION']
    m.classification_codes = line['CLASSIFICATION']
    m.affiliation_code = line['AFFILIATION']
    m.activity_codes = line['ACTIVITY']
    m.organization_code = line['ORGANIZATION']
    classification_code = m.classification_codes.to_s.split('').first.to_i
    classification = Classification.find_by(subsection_code: m.subsection_code, classification_code: classification_code)
    # if  m.subsection_code != 0 && m.subsection_code != 91 && (classification_code != 0 && classification_code != 9)
    if classification != nil
      m.classification_id = classification.id
      m.save
    end
  end
end



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


# #SEED SCRIPT
# source_path = Rails.root.join('db', 'xml_files')

# Dir.glob("#{source_path}/*.xml").each do |xml_file|

#   file = File.open(xml_file)
#   xml = File.read(file)
#   doc = Nokogiri::XML(xml)
#   leaves = doc.xpath('//*[not(*)]')

#   hash = {}
#   leaves.each do |node|
#   hash["#{node.name}"] = node.text
#   end

#   org = Organisation.create(
#     name: hash["BusinessNameLine1"],
#     mission: hash["ActivityOrMissionDesc"],
#     organisation_type: hash["TypeOfOrganizationCorpInd"],
#     address: hash["AddressLine1"],
#     city: hash["City"],
#     state: hash["State"],
#     zip: hash["ZIPCode"],
#     year_formed: hash["FormationYr"],
#     number_of_employees: hash["TotalEmployeeCnt"],
#     domain: hash["WebsiteAddressTxt"]
#   )

#   Revenue.create(
#    organisation_id: org.id,
#    year: hash["TaxYr"],
#    contributions: hash["CYContributionsGrantsAmt"],
#    service_revenue: hash["CYProgramServiceRevenueAmt"],
#    investments: hash["CYInvestmentIncomeAmt"],
#    other: hash["CYTotalRevenueAmt"],
#    total: hash["CYTotalRevenueAmt"]
#    )

#    Expense.create(
#    organisation_id: org.id,
#    year: hash["TaxYr"],
#    grants: hash["CYGrantsAndSimilarPaidAmt"],
#    member_benefits: hash["CYBenefitsPaidToMembersAmt"],
#    salaries: hash["CYSalariesCompEmpBnftPaidAmt"],
#    fundraising_fees: hash["CYTotalProfFndrsngExpnsAmt"],
#    other: hash["CYOtherExpensesAmt"],
#    total: hash["CYTotalExpensesAmt"]
#    )

#   Balance.create(
#     organisation_id: org.id,
#     year: hash["TaxYr"],
#     total_assets: hash["TotalAssetsEOYAmt"],
#     total_liabilities: hash["TotalLiabilitiesEOYAmt"],
#     net_assets: hash["NetAssetsOrFundBalancesEOYAmt"]
#     )

#   Executive.create(
#   organisation_id: org.id,
#   name: hash["PersonNm"],
#   title: hash["TitleTxt"],
#   salary: hash["ReportableCompFromOrgAmt"],
#    )

#     # seed_executives_table(doc)
# end





