require 'csv'

# if Classification.all.length == 0
#   #SEEDING of the classification file
#   classifications_csv = File.read(Rails.root.join('db', 'category_seeding', 'Subsections_Classifications.csv'))
#   classification = CSV.parse(classifications_csv, headers: true, :col_sep => ";",:encoding => 'ISO-8859-1')
#   classification.each do |line|
#   Classification.create(line.to_hash)
#   end
# end

# if Masterfile.all.length == 0
#  #Seeding MASTERFILE
#  source_path_csv = Rails.root.join('db', 'category_seeding', 'regional_files')
#  Dir.glob("#{source_path_csv}/*.csv").each do |csv_file|
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
#  end
# end



# # THIS is not used currently - needs to be altered to get all executive data
# def seed_executives_table(org, doc)
#   puts "method call"
#   doc.search("Form990PartVIISectionAGrp").each do |person_element|
#     puts person_element.elements[1].text
#     # Executive.create(
#     # organisation_id: org.id,
#     # name: person_element.elements[0].text,
#     # title: person_element.elements[1].text,
#     # salary: person_element.elements[0].text

#     # )
#   end
# end


def create_organisation(file_attributes)
  masterfile = Masterfile.find_by(ein: file_attributes["EIN"])
  if masterfile != nil
    org = Organisation.create(
      name: file_attributes["BusinessNameLine1"],
      mission: file_attributes["ActivityOrMissionDesc"],
      ein: file_attributes["EIN"],
      # ein: '000019818',
      address: file_attributes["AddressLine1"],
      city: file_attributes["City"],
      state: file_attributes["State"],
      zip: file_attributes["ZIPCode"],
      year_formed: file_attributes["FormationYr"],
      number_of_employees: file_attributes["TotalEmployeeCnt"],
      domain: file_attributes["WebsiteAddressTxt"],
      masterfile_id: masterfile.id
     )
  else
    false
  end
end


def create_program_service_accomplishments(org, doc)
  # Different paths to access the program service accomplishment data
  prog_service_accomp_path = ['ReturnData/IRS990', 'ReturnData/IRS990/ProgSrvcAccomActy2Grp', 'ReturnData/IRS990/ProgSrvcAccomActy3Grp']

  prog_service_accomp_path.each do |path|
    return_data = doc.search(path)
    return_data_hash = {}
    return_data.children.each do |node|
      return_data_hash["#{node.name}"] = node.text
    end

    if return_data_hash["ExpenseAmt"] != nil
       ProgramServiceAccomplishment.create(
         organisation_id: org.id,
         expense_amount: return_data_hash["ExpenseAmt"] ,
         grant_amount: return_data_hash["GrantAmt"],
         revenues: return_data_hash["RevenueAmt"],
         description: return_data_hash["Desc"],
       )
    end
  end
end

def create_expenses(org, doc, file_attributes)


  # salary attributes from XML file
  total_salary_expense = doc.search('ReturnData/IRS990/CYSalariesCompEmpBnftPaidAmt').text
  officers_and_key_employee_salary_total = doc.search('ReturnData/IRS990/CompCurrentOfcrDirectorsGrp/TotalAmt').text
  disqual_persons_salary_total = doc.search('ReturnData/IRS990/CompDisqualPersonsGrp/TotalAmt').text
  pension_plan_accrual_total = doc.search('ReturnData/IRS990/PensionPlanContributionsGrp/TotalAmt').text
  employee_benefits_total = doc.search('ReturnData/IRS990/OtherEmployeeBenefitsGrp/TotalAmt').text
  payroll_taxes_total = doc.search('ReturnData/IRS990/PayrollTaxesGrp/TotalAmt').text

  # other_expense attributes from XML files, if attribute is empty or nil then it should be 0
  lobbying_total = doc.search('ReturnData/IRS990/FeesForServicesLegalGrp/TotalAmt').text
  advertising_promotion_total = doc.search('ReturnData/IRS990/AdvertisingGrp/TotalAmt').text
  travel_total = doc.search('ReturnData/IRS990/TravelGrp/TotalAmt').text
  entertainment_total = doc.search('ReturnData/IRS990/PymtTravelEntrtnmntPubOfclGrp/TotalAmt').text
  insurance_total = doc.search('ReturnData/IRS990/InsuranceGrp/TotalAmt').text
  management_total = doc.search('ReturnData/IRS990/FeesForServicesManagementGrp/TotalAmt').text
  legal_fees_total = doc.search('ReturnData/IRS990/FeesForServicesLegalGrp/TotalAmt').text
  accounting_total = doc.search('ReturnData/IRS990/FeesForServicesAccountingGrp/TotalAmt').text
  office_expenses_total = doc.search('ReturnData/IRS990/OfficeExpensesGrp/TotalAmt').text
  information_technology_total = doc.search('ReturnData/IRS990/InformationTechnologyGrp/TotalAmt').text
  royalties_total = doc.search('ReturnData/IRS990/RoyaltiesGrp/TotalAmt').text
  conventions_and_meetings_total = doc.search('ReturnData/IRS990/ConferencesMeetingsGrp/TotalAmt').text
  occupancy_total = doc.search('ReturnData/IRS990/OccupancyGrp/TotalAmt').text
  #other_total = doc.search('ReturnData/IRS990/CYOtherExpensesAmt/TotalAmt').text
  other_expenses_total = doc.search('ReturnData/IRS990/CYOtherExpensesAmt/TotalAmt').text

    if doc.search('ReturnData/IRS990/CompCurrentOfcrDirectorsGrp/TotalAmt') != nil
      salary = Salary.create(
        officers_and_key_employees: officers_and_key_employee_salary_total,
        disqual_persons: disqual_persons_salary_total,
        general_salaries_and_wages: pension_plan_accrual_total,
        pension_plan_accruals: employee_benefits_total,
        employee_benefits: employee_benefits_total,
        payroll_taxes: payroll_taxes_total,
        total: total_salary_expense
          ),

      grant = Grant.create(
        ),

      other_expense = OtherExpense.create(
        lobbying: lobbying_total,
        advertising_promotion: advertising_promotion_total,
        travel: travel_total,
        entertainment: entertainment_total,
        insurance: insurance_total,
        management: management_total,
        legal_fees: legal_fees_total,
        accounting: accounting_total,
        office_expenses: office_expenses_total,
        information_technology: information_technology_total,
        royalties: royalties_total,
        conventions_and_meetings: conventions_and_meetings_total,
        occupancy: occupancy_total,
        other: nil, # need to write helper function later to calculate the other total
        total: other_expenses_total
        ),

      Expense.create(
        organisation_id: org.id,
        year: nil, # we can deal w/ year when we are able to get multiple files for a single company
        grant_id: grant.id,
        member_benefits: file_attributes["CYBenefitsPaidToMembersAmt"],
        salary_id: salary.id,
        fundraising_fees: file_attributes["CYTotalFundraisingExpenseAmt"],
        other_expense_id: other_expense.id,
        total: file_attributes["CYTotalExpensesAmt"]
        )
    end
end


#SEED SCRIPT
source_path = Rails.root.join('db', 'xml_files')

Dir.glob("#{source_path}/*.xml").each do |xml_file|

  file = File.open(xml_file)
  xml = File.read(file)
  doc = Nokogiri::XML(xml)

  # Accessing children only - no parent tags
  leaves = doc.xpath('//*[not(*)]')
  file_attributes = {}

  leaves.each do |node|
    file_attributes["#{node.name}"] = node.text
  end


  # Call the different methods to seed files
  if create_organisation(file_attributes)
    org = Organisation.find_by(ein: file_attributes["EIN"])
    create_program_service_accomplishments(org, doc)
    create_expenses(org, doc, file_attributes)
  end

  # ContributionGrant.create(
    # membership_fees: file_attributes["TaxYr"],
    # campaigns: ,
    # fundraising: ,
    # related_organisations: ,
    # government_grants: ,
    # other_gifts_or_donations: ,
    # total:
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
