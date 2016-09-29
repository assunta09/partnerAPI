require 'csv'
require 'json'

#CLASSIFICATION and MASTERFILE seeding needs to be done once before all the other files are seeded
def classification_seeding
  #Classification are according to the IRS - full explanation can be found here: https://www.irs.gov/pub/irs-soi/eo_info.pdf
  if Classification.all.length == 0
    #SEEDING of the classification file
    classifications_csv = File.read(Rails.root.join('db', 'category_seeding', 'Subsections_Classifications.csv'))
    classification = CSV.parse(classifications_csv, headers: true, :col_sep => ";",:encoding => 'ISO-8859-1')
    classification.each do |line|
    Classification.create(line.to_hash)
    end
  end

    #MASTERFILE includes all non-profit organisation with their full categorization.
    #The lists for seeding can be found here: https://www.irs.gov/charities-non-profits/exempt-organizations-business-master-file-extract-eo-bmf
    #Download the lists for all Region 1-4 and add them to the folder regional_files in category seeding (the folder is excluded in git.ignore)
  if Masterfile.all.length == 0
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
      if classification != nil
        m.classification_id = classification.id
        m.save
      end
    end
   end
  end
end

#Category_id. If only a subset of files should be added to the database, call this file to get the object ids for the files
#Choose the categories to be targeted below and uncomment the method call below
#The json file containing the object ids can be found here:
#please add the file to the folder file_selection_by_category
def obtain_category_object_id
  file = File.read("db/category_seeding/file_selection_by_category/index_2015.json")
  data = JSON.parse(file)
  json = data["Filings2015"]

  json.each do |hash|
    masterfile = Masterfile.find_by(ein: hash["EIN"])
    if masterfile != nil
      classification = Classification.find(masterfile.classification_id)
      if classification != nil
        if classification.description == "Organization to Prevent Cruelty to Children"
            CSV.open("db/category_seeding/file_selection_by_category/classification_children_cruelity_prevention.csv", 'a+') do |csv|
              csv << [hash["ObjectId"]]
            end
        elsif classification.description == "Scientific Organization"
            CSV.open("db/category_seeding/file_selection_by_category/classification_scientific_organisation.csv", 'a+') do |csv|
              csv << [hash["ObjectId"]]
            end
        elsif classification.description == "Organization to Prevent Cruelty to Animals"
            CSV.open("db/category_seeding/file_selection_by_category/classification_animal_cruelity_prevention.csv", 'a+') do |csv|
              csv << [hash["ObjectId"]]
            end
        end
      end
    end
  end
end


def create_organisation(doc, file_attributes)

  masterfile = Masterfile.find_by(ein: file_attributes["EIN"])
  if masterfile != nil
    org = Organisation.create(
      name: doc.search("ReturnHeader/Filer/BusinessName").text.gsub("\n", '').strip,
      mission: doc.search("ReturnData/IRS990/ActivityOrMissionDesc").text,
      ein: doc.search("ReturnHeader/Filer/EIN").text,
      # put all USAddress elements into an array since individual tags differ between XML files
      address: doc.search("ReturnHeader/Filer/USAddress").text.gsub("\n", '').strip.split,
      # city: doc.search("ReturnHeader/Filer/USAddress/CityNm#{NEED REGEX}").text,
      # state: doc.search("ReturnHeader/Filer/USAddress/StateAbbreviationCd#{NEED REGEX}").text,
      # zip: doc.search("ReturnHeader/Filer/USAddress/ZIPCd#{NEED REGEX}").text,
      year_formed: doc.search("ReturnData/IRS990/FormationYr").text,
      number_of_employees: doc.search("ReturnData/IRS990/TotalEmployeeCnt").text,
      domain: doc.search("ReturnData/IRS990/WebsiteAddressTxt").text,
      masterfile_id: masterfile.id
     )
  else
    false
  end
end

def create_program_service_accomplishments(org, doc, file_attributes)
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
            year: file_attributes["TaxYr"]
         )
      end
    end
end

def create_revenues(org, doc, file_attributes)
    contribution_grant = Contribution.create(
      membership_fees: file_attributes["MembershipDuesAmt"],
      campaigns: file_attributes["FederatedCampaignsAmt"] ,
      fundraising: doc.search("ReturnData/IRS990/FundraisingAmt").text,
      related_organisations: doc.search("ReturnData/IRS990/RelatedOrganizationsAmt").text,
      government_grants: file_attributes["GovernmentGrantsAmt"],
      other_gifts_or_donations: file_attributes["AllOtherContributionsAmt"],
      total: file_attributes["CYContributionsGrantsAmt"]
    )

    r = Revenue.create(
      organisation_id: org.id,
      year: file_attributes["TaxYr"],
      contribution_id: contribution_grant.id,
      service_revenue: file_attributes["CYProgramServiceRevenueAmt"],
      investments: file_attributes["CYInvestmentIncomeAmt"],
      other: file_attributes["CYOtherRevenueAmt"],
      total: file_attributes["CYTotalRevenueAmt"]
    )
end

def create_expenses(org, doc, file_attributes)
  # salary attributes from XML file
  total_salary_expense = doc.search('ReturnData/IRS990/CYSalariesCompEmpBnftPaidAmt').text
  officers_and_key_employee_salary_total = doc.search('ReturnData/IRS990/CompCurrentOfcrDirectorsGrp/TotalAmt').text
  general_salaries_total = doc.search('ReturnData/IRS990/OtherSalariesAndWagesGrp/TotalAmt').text
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

  #Getting the data for Grants
  domestic_orgs = doc.search('GrantsToDomesticOrgsGrp/TotalAmt').text
  domestic_indiv = doc.search('GrantsToDomesticIndividualsGrp/TotalAmt').text
  foreign_grants = doc.search('ForeignGrantsGrp/TotalAmt').text


  if doc.search('ReturnData/IRS990/CompCurrentOfcrDirectorsGrp/TotalAmt') != nil
   salary = Salary.create(
      officers_and_key_employees: officers_and_key_employee_salary_total,
      disqual_persons: disqual_persons_salary_total,
      general_salaries_and_wages: general_salaries_total,
      pension_plan_accruals: pension_plan_accrual_total,
      employee_benefits: employee_benefits_total,
      payroll_taxes: payroll_taxes_total,
      total: total_salary_expense
    )

    grant = Grant.create(
      domestic_organisations: domestic_orgs,
      domestic_individuals: domestic_indiv,
      foreign_entities: foreign_grants,
      total: file_attributes["CYGrantsAndSimilarPaidAmt"]
    )

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
      other: nil,
      total: other_expenses_total
    )

    def calculate_other_expenses(other_expense)
      expenses_form = 0
       other_expense.attributes.each do |expense_type, value|
        if expense_type != 'other' && expense_type != 'total' && expense_type != "created_at" && expense_type != "updated_at"
          expenses_form += value
        end
      end
      expenses_other = other_expense.total - expenses_form
    end

    other_expense.other = calculate_other_expenses(other_expense)

    Expense.create(
      organisation_id: org.id,
      year: file_attributes["TaxYr"],
      grant_id: grant.id,
      member_benefits: file_attributes["CYBenefitsPaidToMembersAmt"],
      salary_id: salary.id,
      fundraising_fees: file_attributes["CYTotalFundraisingExpenseAmt"],
      other_expense_id: other_expense.id,
      total: file_attributes["CYTotalExpensesAmt"]
    )
  end
end

def create_balance(org, file_attributes)
  Balance.create(
    organisation_id: org.id,
    year: file_attributes["TaxYr"],
    total_assets: file_attributes["TotalAssetsEOYAmt"],
    total_liabilities: file_attributes["TotalLiabilitiesEOYAmt"],
    net_assets: file_attributes["NetAssetsOrFundBalancesEOYAmt"]
    )
end

def create_executive(org, doc, file_attributes)

  path = 'Form990PartVIISectionAGrp'
  # nodes = doc.search(path).text.split("\n")
  if doc.search(path) != nil
    arr = []
    nodes = doc.search(path).children
    nodes.each do |node|
      hash = {}
      hash["#{node.name}"] = node.children.text
      hash.delete('text')
      arr << hash
      arr.reject! {|c| c.empty? }
    end
    arr.each_slice(17).to_a[0..-1]
  end

  executive_array = []
  second_array = []
  # make sub arrays split by the appearance of the hash containing "PersonNm" key
  arr.length.times do |i|
    if arr[i].has_key?("PersonNm")
      executive_array.push(second_array)
      second_array = []
      second_array.push(arr[i])
    else
      second_array.push(arr[i])
    end
  end
  # delete the first blank array in the executive array
  executive_array.delete_at(0)

  executive_array.each do |person_attributes|
    executive_hash = {}
    person_attributes.each do |hash|
      hash.each do |key, value|
        executive_hash[key] = value
      end
    end
    Executive.create(
      organisation_id: org.id,
      name: executive_hash["PersonNm"],
      title: executive_hash["TitleTxt"],
      salary: executive_hash["ReportableCompFromOrgAmt"],
      other_salary: executive_hash["ReportableCompFromRltdOrgAmt"]
    )
  end
end


#===================================================================================================================
#===================================================================================================================
#SEED SCRIPT/ DRIVER CODE

#Uncomment below to get the object_ids for a specific category
# obtain_category_object_id

#Uncomment below to seed classification and masterfile table.
#Both tables should be seeded fully once before seeding the other tables:
# classification_seeding

#===================================================================================================================
#SEEDING of the main tables
source_path = Rails.root.join('db', 'xml_files')

Dir.glob("#{source_path}/*.xml").each do |xml_file|

  file = File.open(xml_file)
  xml = File.read(file)
  doc = Nokogiri::XML(xml)

  # Accessing children only - no parent tags
  leaves = doc.xpath('//*[not(*)]')
  file_attributes = {}
    # Iterate through leaves (tags without children) and assign their name as key and their text as value
  leaves.each do |node|
    file_attributes["#{node.name}"] = node.text
  end

  # Call the different methods to seed files


  if create_organisation(doc, file_attributes)
    org = Organisation.find_by(ein: file_attributes["EIN"])
    create_program_service_accomplishments(org, doc, file_attributes)
    # create_expenses(org, doc, file_attributes)
    # create_revenues(org, doc, file_attributes)
    # create_balance(org, file_attributes)
    # create_executive(org, doc, file_attributes)
  end
end


