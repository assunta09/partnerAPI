require 'csv'

#SEEDING of the classification file
classifications_csv = File.read(Rails.root.join('db', 'category_seeding', 'Subsections_Classifications.csv'))
# classification = CSV.parse(classifications_csv, headers: true, :col_sep => ";",:encoding => 'ISO-8859-1')
# classification.each do |line|
#   Classification.create(line.to_hash)
# end

#Seeding MASTERFILE
# source_path_csv = Rails.root.join('db', 'category_seeding', 'regional_files')
# Dir.glob("#{source_path_csv}/*.csv").each do |csv_file|
#   masterfile_csv = File.read(csv_file)
#   masterfile = CSV.parse(masterfile_csv, headers: true, :encoding => 'ISO-8859-1')
#   masterfile.each do |line|
#     m = Masterfile.new
#     m.ein = line['EIN']
#     m.subsection_code = line['SUBSECTION']
#     m.classification_codes = line['CLASSIFICATION']
#     m.affiliation_code = line['AFFILIATION']
#     m.activity_codes = line['ACTIVITY']
#     m.organization_code = line['ORGANIZATION']
#     classification_code = m.classification_codes.to_s.split('').first.to_i
#     classification = Classification.find_by(subsection_code: m.subsection_code, classification_code: classification_code)
#     # if  m.subsection_code != 0 && m.subsection_code != 91 && (classification_code != 0 && classification_code != 9)
#     if classification != nil
#       m.classification_id = classification.id
#       m.save
#     end
#   end
# end



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
  p leaves

  file_attributes = {}
  leaves.each do |node|
  file_attributes["#{node.name}"] = node.text
  end

  # org = Organisation.create(
  #   name: file_attributes["BusinessNameLine1"],
  #   mission: file_attributes["ActivityOrMissionDesc"],
  #   organisation_type: file_attributes["TypeOfOrganizationCorpInd"],
  #   address: file_attributes["AddressLine1"],
  #   city: file_attributes["City"],
  #   state: file_attributes["State"],
  #   zip: file_attributes["ZIPCode"],
  #   year_formed: file_attributes["FormationYr"],
  #   number_of_employees: file_attributes["TotalEmployeeCnt"],
  #   domain: file_attributes["WebsiteAddressTxt"]
  # )

  # Revenue.create(
  #  organisation_id: org.id,
  #  year: file_attributes["TaxYr"],
  #  contributions: file_attributes["CYContributionsGrantsAmt"],
  #  service_revenue: file_attributes["CYProgramServiceRevenueAmt"],
  #  investments: file_attributes["CYInvestmentIncomeAmt"],
  #  other: file_attributes["CYTotalRevenueAmt"],
  #  total: file_attributes["CYTotalRevenueAmt"]
  #  )

  #  Expense.create(
  #  organisation_id: org.id,
  #  year: file_attributes["TaxYr"],
  #  grants: file_attributes["CYGrantsAndSimilarPaidAmt"],
  #  member_benefits: file_attributes["CYBenefitsPaidToMembersAmt"],
  #  salaries: file_attributes["CYSalariesCompEmpBnftPaidAmt"],
  #  fundraising_fees: file_attributes["CYTotalProfFndrsngExpnsAmt"],
  #  other: file_attributes["CYOtherExpensesAmt"],
  #  total: file_attributes["CYTotalExpensesAmt"]
  #  )

  # Balance.create(
  #   organisation_id: org.id,
  #   year: file_attributes["TaxYr"],
  #   total_assets: file_attributes["TotalAssetsEOYAmt"],
  #   total_liabilities: file_attributes["TotalLiabilitiesEOYAmt"],
  #   net_assets: file_attributes["NetAssetsOrFundBalancesEOYAmt"]
  #   )

  # Executive.create(
  # organisation_id: org.id,
  # name: file_attributes["PersonNm"],
  # title: file_attributes["TitleTxt"],
  # salary: file_attributes["ReportableCompFromOrgAmt"],
  #  )

    # seed_executives_table(doc)
end





