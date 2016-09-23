# require_relative 'example2'

# require 'crack'
require 'json'
require 'hashie'
require 'awesome_print'
# require 'activesupport'

# Organisation.delete_all
# Revenue.delete_all
# Expense.delete_all
# Executive.delete_all
# Balance.delete_all
# Year.delete_all

# org = Organisation.create(
#   name: "Devbootcamp",
#   mission: "Make beautiful and meaningful shit",
#   address: "633 Folsom St.",
#   year_formed: 2016,
#   number_of_employees: 1337,
#   domain: "Devbootcamp.com"
#   )

# year = Year.create(
#   year: 2016)

# Revenue.create(
#   organisation_id: org.id,
#   year_id: year.id,
#   contributions: 5,
#   service_revenue: 5,
#   investments: 5,
#   other: 5,
#   total: 20)

# Expense.create(
#   organisation_id: org.id,
#   year_id: year.id,
#   grants: 10,
#   member_benefits: 20,
#   salaries: 20,
#   fundraising_fees: 20,
#   total: 70
#   )

# Executive.create(
#   organisation_id: org.id,
#   name: "Tedmund Chua",
#   salary: 9999999
#   )

# Balance.create(
#   organisation_id: org.id,
#   year_id: year.id,
#   total_assets: 500,
#   total_liabilities: 400,
#   net_assets: 100
#   )

#This the new seeds area. I'm testing a script 
#for parsing the json file. See below: 

value = '{
  "Return": {
    "-xmlns": "http://www.irs.gov/efile",
    "-xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
    "-xsi:schemaLocation": "http://www.irs.gov/efile",
    "-returnVersion": "2013v4.0",
    "ReturnHeader": {
      "-binaryAttachmentCnt": "0",
      "ReturnTs": "2015-01-14T11:01:49-06:00",
      "TaxPeriodEndDt": "2014-08-31",
      "PreparerFirmGrp": {
        "PreparerFirmEIN": "201766527",
        "PreparerFirmName": { "BusinessNameLine1": "WAUGH & GOODWIN LLP" },
        "PreparerUSAddress": {
          "AddressLine1": "1365 GARDEN OF THE GODS SUITE 150",
          "City": "COLORADO SPRINGS",
          "State": "CO",
          "ZIPCode": "80907"
        }
      },
      "ReturnTypeCd": "990",
      "TaxPeriodBeginDt": "2013-09-01",
      "Filer": {
        "EIN": "362667348",
        "BusinessName": { "BusinessNameLine1": "UNITED STATES OF AMERICA WRESTLING ASSOCIATION" },
        "BusinessNameControlTxt": "UNIT",
        "PhoneNum": "7195988181",
        "USAddress": {
          "AddressLine1": "6155 LEHMAN DRIVE",
          "City": "COLORADO SPRINGS",
          "State": "CO",
          "ZIPCode": "80918"
        }
      },
      "BusinessOfficerGrp": {
        "PersonNm": "DUANE MORGAN",
        "PersonTitleTxt": "TREASURER",
        "PhoneNum": "7195988181",
        "SignatureDt": "2015-01-14",
        "DiscussWithPaidPreparerInd": "1"
      },
      "PreparerPersonGrp": {
        "PreparerPersonNm": "JILL J GOODWIN CPA",
        "PTIN": "P00450838",
        "PhoneNum": "7195909777"
      },
      "TaxYr": "2013",
      "BuildTS": "2016-02-25 16:41:14Z"
    },
    "ReturnData": {
      "-documentCount": "11",
      "IRS990": {
        "-documentId": "RetDoc1038000001",
        "-referenceDocumentId": "RetDoc1044400001",
        "DoingBusinessAsName": { "BusinessNameLine1": "USA WRESTLING" },
        "PrincipalOfficerNm": "RICHARD S BENDER",
        "USAddress": {
          "AddressLine1": "6155 LEHMAN DRIVE",
          "City": "COLORADO SPRINGS",
          "State": "CO",
          "ZIPCode": "80918"
        },
        "GrossReceiptsAmt": "12148760",
        "GroupReturnForAffiliatesInd": "0",
        "Organization501c3Ind": "X",
        "WebsiteAddressTxt": "WWW.THEMAT.COM",
        "TypeOfOrganizationCorpInd": "X",
        "FormationYr": "1974",
        "LegalDomicileStateCd": "CO",
        "ActivityOrMissionDesc": "USA WRESTLING, GUIDED BY THE OLYMPIC SPIRIT, PROVIDES QUALITY OPPORTUNITIES FOR ITS MEMBERS TO ACHIEVE THEIR FULL HUMAN AND ATHLETIC POTENTIAL.",
        "VotingMembersGoverningBodyCnt": "35",
        "VotingMembersIndependentCnt": "35",
        "TotalEmployeeCnt": "45",
        "TotalVolunteersCnt": "5000",
        "TotalGrossUBIAmt": "89164",
        "NetUnrelatedBusTxblIncmAmt": "-47216",
        "PYContributionsGrantsAmt": "3930889",
        "CYContributionsGrantsAmt": "3733516",
        "PYProgramServiceRevenueAmt": "7034036",
        "CYProgramServiceRevenueAmt": "7649220",
        "PYInvestmentIncomeAmt": "344040",
        "CYInvestmentIncomeAmt": "548461",
        "PYOtherRevenueAmt": "214470",
        "CYOtherRevenueAmt": "194871",
        "PYTotalRevenueAmt": "11523435",
        "CYTotalRevenueAmt": "12126068",
        "PYGrantsAndSimilarPaidAmt": "368699",
        "CYGrantsAndSimilarPaidAmt": "759225",
        "PYBenefitsPaidToMembersAmt": "0",
        "CYBenefitsPaidToMembersAmt": "0",
        "PYSalariesCompEmpBnftPaidAmt": "3344701",
        "CYSalariesCompEmpBnftPaidAmt": "3516295",
        "PYTotalProfFndrsngExpnsAmt": "0",
        "CYTotalProfFndrsngExpnsAmt": "0",
        "CYTotalFundraisingExpenseAmt": "255499",
        "PYOtherExpensesAmt": "7434205",
        "CYOtherExpensesAmt": "8209812",
        "PYTotalExpensesAmt": "11147605",
        "CYTotalExpensesAmt": "12485332",
        "PYRevenuesLessExpensesAmt": "375830",
        "CYRevenuesLessExpensesAmt": "-359264",
        "TotalAssetsBOYAmt": "8190470",
        "TotalAssetsEOYAmt": "8078319",
        "TotalLiabilitiesBOYAmt": "1310399",
        "TotalLiabilitiesEOYAmt": "1482895",
        "NetAssetsOrFundBalancesBOYAmt": "6880071",
        "NetAssetsOrFundBalancesEOYAmt": "6595424",
        "InfoInScheduleOPartIIIInd": "X",
        "MissionDesc": "USA WRESTLING, GUIDED BY THE OLYMPIC SPIRIT, PROVIDES QUALITY OPPORTUNITIES FOR ITS MEMBERS TO ACHIEVE THEIR FULL HUMAN AND ATHLETIC POTENTIAL.",
        "SignificantNewProgramSrvcInd": "1",
        "SignificantChangeInd": "1",
        "ExpenseAmt": "5707442",
        "GrantAmt": "759225",
        "RevenueAmt": "915313",
        "Desc": "NATIONAL TEAMS PROGRAMS:PROVIDED OPPORTUNITIES FOR MORE THAN FOUR HUNDRED ATHLETES, ON THE CADET, JUNIOR, UNIVERSITY, FILA JUNIORS AND OLYMPIC LEVELS, TO PARTICIPATE IN APPROXIMATELY SEVENTY INTERNATIONAL TOURS, TRAINING CAMPS, AND/OR TOURNAMENTS. ASSISTED WITH THE TRAINING EXPENSES FOR MORE THAN SEVENTY WRESTLERS ON THE SENIOR LEVEL NATIONAL TEAMS AND AN ADDITIONAL SEVENTY-PLUS HIGHLY RANKED SENIOR LEVEL WRESTLERS WHO PERFORMED WELL IN VARIOUS COMPETITIONS.",
        "ProgSrvcAccomActy2Grp": {
          "ExpenseAmt": "3092585",
          "RevenueAmt": "5058577",
          "Desc": "MEMBERSHIP:PROVIDED MEDICAL AND LIABILITY INSURANCE TO COVER APPROXIMATELY 194,000 WRESTLERS, 28,300 COACHES, 4,400 WRESTLING CLUBS AND 2,100 WRESTLING EVENTS. PROVIDED FUNDS AND INSTRUCTIONAL MATERIALS TO STATE ORGANIZATIONS AND MEMBER CLUBS. PROVIDED THE ORGANIZATIONS PUBLICATION, THE USA WRESTLER, TO ALL MEMBERS TO PROMOTE KNOWLEDGE OF AND OPPORTUNITIES TO PARTICIPATE IN THE SPORT."
        },
        "ProgSrvcAccomActy3Grp": {
          "ExpenseAmt": "2368492",
          "RevenueAmt": "1572203",
          "Desc": "EVENTS AND EDUCATIONAL PROGRAMS:PROVIDED OPPORTUNITIES TO OUR 194,000 MEMBERS OF KIDS, CADETS, JUNIORS, FILA JUNIORS, UNIVERSITY AND OLYMPIC LEVEL TO COMPETE IN APPROXIMATELY THIRTY-FIVE INTERNATIONAL-, NATIONAL- AND REGIONAL-LEVEL EVENTS. ALSO COORDINATED SPORTS SCIENCE RESEARCH REGARDING WRESTLING AND EDUCATIONAL PROGRAMS AVAILABLE TO OUR 28,300 MEMBER COACHES."
        },
        "ProgSrvcAccomActyOtherGrp": [
          {
            "ExpenseAmt": "34475",
            "Desc": "KEEP WRESTLING IN THE OLYMPICS:UPON THE 2/12/13 DECISION OF THE IOC EXECUTIVE BOARD TO RECOMMEND THE ELIMINATION OF WRESTLING AS A CORE SPORT IN THE OLYMPIC GAMES, PROVIDED FUNDS AND ACTIVITIES FOR THE PROMOTION OF AND EDUCATION ABOUT THE SPORT OF WRESTLING FOR EFFORTS TO AFFECT THE USOCS DECISION REGARDING THE RETENTION OF THE SPORT IN THE OLYMPIC GAMES."
          },
          {
            "ExpenseAmt": "536867",
            "Desc": "SPORT DEVELOPMENT/BROADCASTING:USA WRESTLING PROVIDES SERVICES, PRODUCTION, PROMOTION, COORDINATION AND OTHER EXPENSES RELATED TO TELEVISION AND BROADCAST COVERAGE OF FIVE NATIONAL AND INTERNATIONAL WRESTLING EVENTS TO INCREASE MEDIA AND PUBLIC EXPOSURE AND FAMILIARITY WITH THE SPORT OF WRESTLING AND TO ENCOURAGE PARTICIPATION."
          }
        ],
        "TotalOtherProgSrvcExpenseAmt": "571342",
        "TotalProgramServiceExpensesAmt": "11739861",
        "DescribedInSection501c3Ind": {
          "-referenceDocumentId": "RetDoc1039100001",
          "#text": "1"
        },
        "ScheduleBRequiredInd": {
          "-referenceDocumentId": "RetDoc1234500001",
          "#text": "1"
        },
        "PoliticalCampaignActyInd": "0",
        "LobbyingActivitiesInd": "0",
        "SubjectToProxyTaxInd": "0",
        "DonorAdvisedFundInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "0"
        },
        "ConservationEasementsInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "0"
        },
        "CollectionsOfArtInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "0"
        },
        "CreditCounselingInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "0"
        },
        "TempOrPermanentEndowmentsInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "1"
        },
        "ReportLandBuildingEquipmentInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "1"
        },
        "ReportInvestmentsOtherSecInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "1"
        },
        "ReportProgramRelatedInvstInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "0"
        },
        "ReportOtherAssetsInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "0"
        },
        "ReportOtherLiabilitiesInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "0"
        },
        "IncludeFIN48FootnoteInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "1"
        },
        "IndependentAuditFinclStmtInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "1"
        },
        "ConsolidatedAuditFinclStmtInd": {
          "-referenceDocumentId": "RetDoc1040000001",
          "#text": "0"
        },
        "SchoolOperatingInd": "0",
        "ForeignOfficeInd": "0",
        "ForeignActivitiesInd": {
          "-referenceDocumentId": "RetDoc1040500001",
          "#text": "1"
        },
        "MoreThan5000KToOrgInd": {
          "-referenceDocumentId": "RetDoc1040500001",
          "#text": "1"
        },
        "MoreThan5000KToIndividualsInd": {
          "-referenceDocumentId": "RetDoc1040500001",
          "#text": "0"
        },
        "ProfessionalFundraisingInd": {
          "-referenceDocumentId": "RetDoc1041300001",
          "#text": "0"
        },
        "FundraisingActivitiesInd": {
          "-referenceDocumentId": "RetDoc1041300001",
          "#text": "1"
        },
        "GamingActivitiesInd": {
          "-referenceDocumentId": "RetDoc1041300001",
          "#text": "0"
        },
        "OperateHospitalInd": "0",
        "GrantsToOrganizationsInd": {
          "-referenceDocumentId": "RetDoc1041900001",
          "#text": "0"
        },
        "GrantsToIndividualsInd": {
          "-referenceDocumentId": "RetDoc1041900001",
          "#text": "1"
        },
        "ScheduleJRequiredInd": {
          "-referenceDocumentId": "RetDoc1042400001",
          "#text": "1"
        },
        "TaxExemptBondsInd": "0",
        "EngagedInExcessBenefitTransInd": "0",
        "PYExcessBenefitTransInd": "0",
        "LoanOutstandingInd": "0",
        "GrantToRelatedPersonInd": "0",
        "BusinessRlnWithOrgMemInd": "0",
        "BusinessRlnWithFamMemInd": "0",
        "BusinessRlnWithOfficerEntInd": "0",
        "DeductibleNonCashContriInd": {
          "-referenceDocumentId": "RetDoc1042900001",
          "#text": "1"
        },
        "DeductibleArtContributionInd": {
          "-referenceDocumentId": "RetDoc1042900001",
          "#text": "0"
        },
        "TerminateOperationsInd": "0",
        "PartialLiquidationInd": "0",
        "DisregardedEntityInd": {
          "-referenceDocumentId": "RetDoc1043400001",
          "#text": "0"
        },
        "RelatedEntityInd": {
          "-referenceDocumentId": "RetDoc1043400001",
          "#text": "1"
        },
        "RelatedOrganizationCtrlEntInd": "0",
        "TrnsfrExmptNonChrtblRltdOrgInd": {
          "-referenceDocumentId": "RetDoc1043400001",
          "#text": "0"
        },
        "ActivitiesConductedPrtshpInd": {
          "-referenceDocumentId": "RetDoc1043400001",
          "#text": "0"
        },
        "ScheduleORequiredInd": "1",
        "IRPDocumentCnt": "138",
        "IRPDocumentW2GCnt": "0",
        "BackupWthldComplianceInd": "1",
        "EmployeeCnt": "45",
        "EmploymentTaxReturnsFiledInd": "1",
        "UnrelatedBusIncmOverLimitInd": "1",
        "Form990TFiledInd": "1",
        "ForeignFinancialAccountInd": "0",
        "ProhibitedTaxShelterTransInd": "0",
        "TaxablePartyNotificationInd": "0",
        "NondeductibleContributionsInd": "0",
        "QuidProQuoContributionsInd": "0",
        "Form8282PropertyDisposedOfInd": "0",
        "RcvFndsToPayPrsnlBnftCntrctInd": "0",
        "PayPremiumsPrsnlBnftCntrctInd": "0",
        "IndoorTanningServicesInd": "0",
        "InfoInScheduleOPartVIInd": "X",
        "GoverningBodyVotingMembersCnt": "35",
        "IndependentVotingMemberCnt": "35",
        "FamilyOrBusinessRlnInd": "1",
        "DelegationOfMgmtDutiesInd": "0",
        "ChangeToOrgDocumentsInd": "0",
        "MaterialDiversionOrMisuseInd": "0",
        "MembersOrStockholdersInd": "1",
        "ElectionOfBoardMembersInd": "1",
        "DecisionsSubjectToApprovaInd": "0",
        "MinutesOfGoverningBodyInd": "1",
        "MinutesOfCommitteesInd": "1",
        "OfficerMailingAddressInd": "0",
        "LocalChaptersInd": "1",
        "PoliciesReferenceChaptersInd": "1",
        "Form990ProvidedToGvrnBodyInd": "0",
        "ConflictOfInterestPolicyInd": "1",
        "AnnualDisclosureCoveredPrsnInd": "1",
        "RegularMonitoringEnfrcInd": "1",
        "WhistleblowerPolicyInd": "1",
        "DocumentRetentionPolicyInd": "1",
        "CompensationProcessCEOInd": "1",
        "CompensationProcessOtherInd": "0",
        "InvestmentInJointVentureInd": "0",
        "StatesWhereCopyOfReturnIsFldCd": [
          "AL",
          "AK",
          "CO",
          "CT",
          "FL",
          "KS",
          "ME",
          "MD",
          "MA",
          "MI",
          "MN",
          "MS",
          "MO",
          "NJ",
          "NC",
          "OH",
          "OK",
          "OR",
          "PA",
          "SC",
          "TN",
          "UT",
          "VA",
          "WA",
          "WI",
          "IL",
          "NY"
        ],
        "OwnWebsiteInd": "X",
        "UponRequestInd": "X",
        "BooksInCareOfDetail": {
          "BusinessName": { "BusinessNameLine1": "THE ORGANIZATION" },
          "PhoneNum": "7195988181",
          "USAddress": {
            "AddressLine1": "6155 LEHMAN DRIVE",
            "City": "COLORADO SPRINGS",
            "State": "CO",
            "ZIPCode": "80918"
          }
        },
        "InfoInScheduleOPartVIIInd": "X",
        "Form990PartVIISectionAGrp": [
          {
            "PersonNm": "JAMES RAVANNACK",
            "TitleTxt": "PRESIDENT",
            "AverageHoursPerWeekRt": "20.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "GREG STROBEL",
            "TitleTxt": "VICE PRESIDENT",
            "AverageHoursPerWeekRt": "20.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "BRUCE BAUMGARTNER",
            "TitleTxt": "VICE PRESIDENT",
            "AverageHoursPerWeekRt": "20.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "DUANE MORGAN",
            "TitleTxt": "SECRETARY/TREASURER",
            "AverageHoursPerWeekRt": "20.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "WILLIAM GRANT",
            "TitleTxt": "INTERIM SECRETARY",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "VAN STOKES",
            "TitleTxt": "TREASURER/SECRETARY",
            "AverageHoursPerWeekRt": "20.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "STAN DZIEDZIC",
            "TitleTxt": "PAST PRESIDENT",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "IRIS SMITH",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "JEFF JARNECKE",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "MIKE JUBY",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "MAJOR DANIEL HICKS",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "LOUIS ROSBOTTOM",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "MARK KRUG",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "TERVEL DLAGNEV",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "PATRICIA FOX",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "SARA FULP-ALLEN BAHOURIS",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "MARCO LARA",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "RICK TUCCI",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "TEAGUE MOORE",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "MIKE MOYER",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "MARCIE VAN DUSEN",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "ZAC DOMINGUEZ",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "SONNY GREENHALGH",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "MARK REILAND",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "PATRICIA SAUNDERS",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "MIKE DUROE",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "MIKE MOYER",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "LEE ROY SMITH",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "BRENT METCALF",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "PAUL ROHLER",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "NATE ENGEL",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "CRAIG LAMONT",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "ANTHONY HOLMAN",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "JUSTIN LESTER",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "JIM KEEN",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "JON ANDERSON",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "DAVE BLACK",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "ARCHIE RANDALL",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "CHRIS KALLAI",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "ANTHONY FLATT",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "BOB COLGATE",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "JORDAN HOLM",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "JASON FORD",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "KERRY MCCOY",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "JD BERGMAN",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "JOE RUSSELL",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "JIM CONSIDINE",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "AUSTIN BENNETT",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "BILL STECKLEIN",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "JON READER",
            "TitleTxt": "BOARD MEMBER",
            "AverageHoursPerWeekRt": "5.00",
            "IndividualTrusteeOrDirectorInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "RICHARD BENDER",
            "TitleTxt": "EXECUTIVE DIRECTOR",
            "AverageHoursPerWeekRt": "60.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "245473",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "13974"
          },
          {
            "PersonNm": "DWAINE COOPER",
            "TitleTxt": "ASSOC EXECUTIVE DIRECTOR",
            "AverageHoursPerWeekRt": "50.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "144900",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "8245"
          },
          {
            "PersonNm": "LESLIE L GUTCHES",
            "TitleTxt": "ASSOC EXECUTIVE DIRECTOR",
            "AverageHoursPerWeekRt": "50.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "132600",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "8630"
          },
          {
            "PersonNm": "LARRY L JONES JR",
            "TitleTxt": "NATIONAL FREESTYLE COACH",
            "AverageHoursPerWeekRt": "40.00",
            "HighestCompensatedEmployeeInd": "X",
            "ReportableCompFromOrgAmt": "175100",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "10755"
          },
          {
            "PersonNm": "STEVEN H FRASER",
            "TitleTxt": "NATIONAL GRECO-ROMAN HEAD COACH",
            "AverageHoursPerWeekRt": "40.00",
            "HighestCompensatedEmployeeInd": "X",
            "ReportableCompFromOrgAmt": "117100",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "6855"
          },
          {
            "PersonNm": "TERRY L STEINER",
            "TitleTxt": "NATIONAL WOMENS COACH",
            "AverageHoursPerWeekRt": "40.00",
            "HighestCompensatedEmployeeInd": "X",
            "ReportableCompFromOrgAmt": "120100",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "8005"
          }
        ],
        "TotalReportableCompFromOrgAmt": "935273",
        "TotReportableCompRltdOrgAmt": "0",
        "TotalOtherCompensationAmt": "56464",
        "IndivRcvdGreaterThan100KCnt": "6",
        "FormerOfcrEmployeesListedInd": "0",
        "TotalCompGreaterThan150KInd": "1",
        "CompensationFromOtherSrcsInd": "0",
        "ContractorCompensationGrp": [
          {
            "ContractorName": {
              "BusinessName": { "BusinessNameLine1": "KETCHUM INC" }
            },
            "ContractorAddress": {
              "USAddress": {
                "AddressLine1": "141 W 36TH STREET 11TH FLOOR",
                "City": "NEW YORK",
                "State": "NY",
                "ZIPCode": "10018"
              }
            },
            "ServicesDesc": "PR FIRM",
            "CompensationAmt": "275000"
          },
          {
            "ContractorName": {
              "BusinessName": { "BusinessNameLine1": "QUAD GRAPHICS" }
            },
            "ContractorAddress": {
              "USAddress": {
                "AddressLine1": "N61 W23044 HARRYS WAY",
                "City": "SUSSEX",
                "State": "WI",
                "ZIPCode": "530893995"
              }
            },
            "ServicesDesc": "PRINTING NEWSPAPER",
            "CompensationAmt": "217310"
          },
          {
            "ContractorName": { "PersonNm": "JORDAN BURROUGHS" },
            "ContractorAddress": {
              "USAddress": {
                "AddressLine1": "2200 SHERIDAN BLVD",
                "City": "LINCOLN",
                "State": "NE",
                "ZIPCode": "68502"
              }
            },
            "ServicesDesc": "INDEPENDENT CONTRACTOR",
            "CompensationAmt": "188900"
          },
          {
            "ContractorName": { "PersonNm": "JAMES E SCHERR" },
            "ContractorAddress": {
              "USAddress": {
                "AddressLine1": "2016 DIAMOND CREEK DRIVE",
                "City": "COLORADO SPRINGS",
                "State": "CO",
                "ZIPCode": "80921"
              }
            },
            "ServicesDesc": "INDEPENDENT CONTRACTOR",
            "CompensationAmt": "180000"
          },
          {
            "ContractorName": {
              "BusinessName": { "BusinessNameLine1": "NORTHERN MICHIGAN UNIVERSITY" }
            },
            "ContractorAddress": {
              "USAddress": {
                "AddressLine1": "1401 PRESQUE ISLE AVE",
                "City": "MARQUETTE",
                "State": "MI",
                "ZIPCode": "69855"
              }
            },
            "ServicesDesc": "NMU COACHES",
            "CompensationAmt": "132124"
          }
        ],
        "CntrctRcvdGreaterThan100KCnt": "6",
        "FederatedCampaignsAmt": "28015",
        "FundraisingAmt": "57100",
        "RelatedOrganizationsAmt": "1592617",
        "AllOtherContributionsAmt": "2055784",
        "NoncashContributionsAmt": "332808",
        "TotalContributionsAmt": "3733516",
        "ProgramServiceRevenueGrp": [
          {
            "Desc": "MEMBERSHIP REVENUE",
            "BusinessCd": "900099",
            "TotalRevenueColumnAmt": "5058577",
            "RelatedOrExemptFuncIncomeAmt": "5058577"
          },
          {
            "Desc": "EDUCATIONAL PROGRAMS",
            "BusinessCd": "900099",
            "TotalRevenueColumnAmt": "1572203",
            "RelatedOrExemptFuncIncomeAmt": "1572203"
          },
          {
            "Desc": "TOUR AND PROGRAM REVENUE",
            "BusinessCd": "900099",
            "TotalRevenueColumnAmt": "915313",
            "RelatedOrExemptFuncIncomeAmt": "915313"
          },
          {
            "Desc": "ADVERTISING REVENUE",
            "BusinessCd": "541800",
            "TotalRevenueColumnAmt": "89164",
            "UnrelatedBusinessRevenueAmt": "89164"
          },
          {
            "Desc": "OTHER PROGRAM REVENUE",
            "BusinessCd": "900099",
            "TotalRevenueColumnAmt": "12880",
            "RelatedOrExemptFuncIncomeAmt": "12880"
          }
        ],
        "TotalOthProgramServiceRevGrp": {
          "TotalRevenueColumnAmt": "1083",
          "RelatedOrExemptFuncIncomeAmt": "1083"
        },
        "TotalProgramServiceRevenueAmt": "7649220",
        "InvestmentIncomeGrp": {
          "TotalRevenueColumnAmt": "21859",
          "ExclusionAmt": "21859"
        },
        "RoyaltiesRevenueGrp": {
          "TotalRevenueColumnAmt": "214163",
          "RelatedOrExemptFuncIncomeAmt": "214163"
        },
        "GrossAmountSalesAssetsGrp": { "SecuritiesAmt": "526602" },
        "LessCostOthBasisSalesExpnssGrp": { "SecuritiesAmt": "0" },
        "GainOrLossGrp": { "SecuritiesAmt": "526602" },
        "NetGainOrLossInvestmentsGrp": {
          "TotalRevenueColumnAmt": "526602",
          "ExclusionAmt": "526602"
        },
        "FundraisingGrossIncomeAmt": "3400",
        "ContriRptFundraisingEventAmt": "57100",
        "FundraisingDirectExpensesAmt": "22692",
        "NetIncmFromFundraisingEvtGrp": {
          "TotalRevenueColumnAmt": "-19292",
          "ExclusionAmt": "-19292"
        },
        "TotalRevenueGrp": {
          "TotalRevenueColumnAmt": "12126068",
          "RelatedOrExemptFuncIncomeAmt": "7774219",
          "UnrelatedBusinessRevenueAmt": "89164",
          "ExclusionAmt": "529169"
        },
        "GrantsToDomesticIndividualsGrp": {
          "TotalAmt": "693225",
          "ProgramServicesAmt": "693225"
        },
        "ForeignGrantsGrp": {
          "TotalAmt": "66000",
          "ProgramServicesAmt": "66000"
        },
        "CompCurrentOfcrDirectorsGrp": {
          "TotalAmt": "556649",
          "ProgramServicesAmt": "449156",
          "ManagementAndGeneralAmt": "70515",
          "FundraisingAmt": "36978"
        },
        "OtherSalariesAndWagesGrp": {
          "TotalAmt": "2286099",
          "ProgramServicesAmt": "2079155",
          "ManagementAndGeneralAmt": "130725",
          "FundraisingAmt": "76219"
        },
        "PensionPlanContributionsGrp": {
          "TotalAmt": "110417",
          "ProgramServicesAmt": "81101",
          "ManagementAndGeneralAmt": "18762",
          "FundraisingAmt": "10554"
        },
        "OtherEmployeeBenefitsGrp": {
          "TotalAmt": "354014",
          "ProgramServicesAmt": "334967",
          "ManagementAndGeneralAmt": "12190",
          "FundraisingAmt": "6857"
        },
        "PayrollTaxesGrp": {
          "TotalAmt": "209116",
          "ProgramServicesAmt": "186729",
          "ManagementAndGeneralAmt": "14328",
          "FundraisingAmt": "8059"
        },
        "FeesForServicesOtherGrp": {
          "TotalAmt": "593606",
          "ProgramServicesAmt": "565823",
          "ManagementAndGeneralAmt": "17781",
          "FundraisingAmt": "10002"
        },
        "AdvertisingGrp": {
          "TotalAmt": "174330",
          "ProgramServicesAmt": "106630",
          "ManagementAndGeneralAmt": "59920",
          "FundraisingAmt": "7780"
        },
        "OfficeExpensesGrp": {
          "TotalAmt": "345728",
          "ProgramServicesAmt": "317775",
          "ManagementAndGeneralAmt": "17478",
          "FundraisingAmt": "10475"
        },
        "InformationTechnologyGrp": {
          "TotalAmt": "42279",
          "ProgramServicesAmt": "42279"
        },
        "OccupancyGrp": {
          "TotalAmt": "49389",
          "ProgramServicesAmt": "28058",
          "ManagementAndGeneralAmt": "17964",
          "FundraisingAmt": "3367"
        },
        "TravelGrp": {
          "TotalAmt": "3116107",
          "ProgramServicesAmt": "3042036",
          "ManagementAndGeneralAmt": "52958",
          "FundraisingAmt": "21113"
        },
        "DepreciationDepletionGrp": {
          "TotalAmt": "43226",
          "ProgramServicesAmt": "34478",
          "ManagementAndGeneralAmt": "5599",
          "FundraisingAmt": "3149"
        },
        "InsuranceGrp": {
          "TotalAmt": "1283321",
          "ProgramServicesAmt": "1273603",
          "ManagementAndGeneralAmt": "8138",
          "FundraisingAmt": "1580"
        },
        "OtherExpensesGrp": [
          {
            "Desc": "PRODUCTION COSTS",
            "TotalAmt": "584989",
            "ProgramServicesAmt": "583213",
            "FundraisingAmt": "1776"
          },
          {
            "Desc": "SITE COSTS",
            "TotalAmt": "528510",
            "ProgramServicesAmt": "528510"
          },
          {
            "Desc": "SUPPLIES AND EQUIPMENT",
            "TotalAmt": "261721",
            "ProgramServicesAmt": "255638",
            "ManagementAndGeneralAmt": "5986",
            "FundraisingAmt": "97"
          },
          {
            "Desc": "OTHER EXPENSES",
            "TotalAmt": "224473",
            "ProgramServicesAmt": "206494",
            "ManagementAndGeneralAmt": "14173",
            "FundraisingAmt": "3806"
          }
        ],
        "AllOtherExpensesGrp": {
          "TotalAmt": "962133",
          "ProgramServicesAmt": "864991",
          "ManagementAndGeneralAmt": "43455",
          "FundraisingAmt": "53687"
        },
        "TotalFunctionalExpensesGrp": {
          "TotalAmt": "12485332",
          "ProgramServicesAmt": "11739861",
          "ManagementAndGeneralAmt": "489972",
          "FundraisingAmt": "255499"
        },
        "CashNonInterestBearingGrp": {
          "BOYAmt": "26447",
          "EOYAmt": "30896"
        },
        "SavingsAndTempCashInvstGrp": {
          "BOYAmt": "3214259",
          "EOYAmt": "2804284"
        },
        "PledgesAndGrantsReceivableGrp": {
          "BOYAmt": "30178",
          "EOYAmt": "30178"
        },
        "AccountsReceivableGrp": {
          "BOYAmt": "258150",
          "EOYAmt": "363620"
        },
        "InventoriesForSaleOrUseGrp": {
          "BOYAmt": "63086",
          "EOYAmt": "78788"
        },
        "PrepaidExpensesDefrdChargesGrp": {
          "BOYAmt": "259647",
          "EOYAmt": "376410"
        },
        "LandBldgEquipCostOrOtherBssAmt": "1079439",
        "LandBldgEquipAccumDeprecAmt": "749877",
        "LandBldgEquipBasisNetGrp": {
          "BOYAmt": "365833",
          "EOYAmt": "329562"
        },
        "InvestmentsPubTradedSecGrp": {
          "BOYAmt": "2532575",
          "EOYAmt": "2389273"
        },
        "InvestmentsOtherSecuritiesGrp": {
          "BOYAmt": "1440295",
          "EOYAmt": "1675308"
        },
        "TotalAssetsGrp": {
          "BOYAmt": "8190470",
          "EOYAmt": "8078319"
        },
        "AccountsPayableAccrExpnssGrp": {
          "BOYAmt": "967257",
          "EOYAmt": "1078164"
        },
        "DeferredRevenueGrp": {
          "BOYAmt": "343142",
          "EOYAmt": "404731"
        },
        "TotalLiabilitiesGrp": {
          "BOYAmt": "1310399",
          "EOYAmt": "1482895"
        },
        "OrganizationFollowsSFAS117Ind": "X",
        "UnrestrictedNetAssetsGrp": {
          "BOYAmt": "2294128",
          "EOYAmt": "1995049"
        },
        "TemporarilyRstrNetAssetsGrp": {
          "BOYAmt": "4585943",
          "EOYAmt": "4600375"
        },
        "TotalNetAssetsFundBalanceGrp": {
          "BOYAmt": "6880071",
          "EOYAmt": "6595424"
        },
        "TotLiabNetAssetsFundBalanceGrp": {
          "BOYAmt": "8190470",
          "EOYAmt": "8078319"
        },
        "ReconcilationRevenueExpnssAmt": "-359264",
        "NetUnrlzdGainsLossesInvstAmt": "74617",
        "OtherChangesInNetAssetsAmt": "0",
        "InfoInScheduleOPartXIIInd": "X",
        "MethodOfAccountingAccrualInd": "X",
        "AccountantCompileOrReviewInd": "0",
        "FSAuditedInd": "1",
        "FSAuditedBasisGrp": { "SeparateBasisFinclStmtInd": "X" },
        "AuditCommitteeInd": "1",
        "FederalGrantAuditRequiredInd": "0"
      },
      "IRS990ScheduleA": {
        "-documentId": "RetDoc1039100001",
        "PubliclySupportedOrg509a2Ind": "X",
        "GiftsGrantsContrisRcvd509Grp": {
          "CurrentTaxYearMinus4YearsAmt": "2370300",
          "CurrentTaxYearMinus3YearsAmt": "2263239",
          "CurrentTaxYearMinus2YearsAmt": "3458541",
          "CurrentTaxYearMinus1YearAmt": "3930889",
          "CurrentTaxYearAmt": "3733516",
          "TotalAmt": "15756485"
        },
        "GrossReceiptsAdmissionsGrp": {
          "CurrentTaxYearMinus4YearsAmt": "5965864",
          "CurrentTaxYearMinus3YearsAmt": "6608714",
          "CurrentTaxYearMinus2YearsAmt": "7961589",
          "CurrentTaxYearMinus1YearAmt": "7293623",
          "CurrentTaxYearAmt": "8090058",
          "TotalAmt": "35919848"
        },
        "Total509Grp": {
          "CurrentTaxYearMinus4YearsAmt": "8336164",
          "CurrentTaxYearMinus3YearsAmt": "8871953",
          "CurrentTaxYearMinus2YearsAmt": "11420130",
          "CurrentTaxYearMinus1YearAmt": "11224512",
          "CurrentTaxYearAmt": "11823574",
          "TotalAmt": "51676333"
        },
        "AmountsRcvdDsqlfyPersonGrp": { "TotalAmt": "0" },
        "SubstantialContributorsAmtGrp": { "TotalAmt": "0" },
        "SubstAndDsqlfyPrsnsTotGrp": { "TotalAmt": "0" },
        "PublicSupportTotal509Amt": "51676333",
        "GrossInvestmentIncome509Grp": {
          "CurrentTaxYearMinus4YearsAmt": "229564",
          "CurrentTaxYearMinus3YearsAmt": "208682",
          "CurrentTaxYearMinus2YearsAmt": "217085",
          "CurrentTaxYearMinus1YearAmt": "240182",
          "CurrentTaxYearAmt": "236022",
          "TotalAmt": "1131535"
        },
        "InvestmentIncomeAndUBTIGrp": {
          "CurrentTaxYearMinus4YearsAmt": "229564",
          "CurrentTaxYearMinus3YearsAmt": "208682",
          "CurrentTaxYearMinus2YearsAmt": "217085",
          "CurrentTaxYearMinus1YearAmt": "240182",
          "CurrentTaxYearAmt": "236022",
          "TotalAmt": "1131535"
        },
        "TotalSupportCalendarYearGrp": {
          "CurrentTaxYearMinus4YearsAmt": "8565728",
          "CurrentTaxYearMinus3YearsAmt": "9080635",
          "CurrentTaxYearMinus2YearsAmt": "11637215",
          "CurrentTaxYearMinus1YearAmt": "11464694",
          "CurrentTaxYearAmt": "12059596",
          "TotalAmt": "52807868"
        },
        "PublicSupportCY509Pct": "0.97860",
        "PublicSupportPY509Pct": "0.97630",
        "InvestmentIncomeCYPct": "0.02140",
        "InvestmentIncomePYPct": "0.02370",
        "ThirtyThrPctSuprtTestsCY509Ind": "X"
      },
      "IRS990ScheduleB": {
        "-documentId": "RetDoc1234500001",
        "ContributorInformationGrp": {
          "ContributorNum": "RESTRICTED",
          "ContributorBusinessName": { "BusinessNameLine1": "RESTRICTED" },
          "ContributorUSAddress": {
            "AddressLine1": "RESTRICTED",
            "AddressLine2": "RESTRICTED",
            "City": "RESTRICTED",
            "State": "RESTRICTED",
            "ZIPCode": "RESTRICTED"
          },
          "TotalContributionsAmt": "RESTRICTED"
        }
      },
      "IRS990ScheduleD": {
        "-documentId": "RetDoc1040000001",
        "CYEndwmtFundGrp": {
          "BeginningYearBalanceAmt": "2327180",
          "InvestmentEarningsOrLossesAmt": "92003",
          "EndYearBalanceAmt": "2419183"
        },
        "CYMinus1YrEndwmtFundGrp": {
          "BeginningYearBalanceAmt": "2269913",
          "InvestmentEarningsOrLossesAmt": "57267",
          "EndYearBalanceAmt": "2327180"
        },
        "CYMinus2YrEndwmtFundGrp": {
          "BeginningYearBalanceAmt": "2238576",
          "InvestmentEarningsOrLossesAmt": "31337",
          "EndYearBalanceAmt": "2269913"
        },
        "CYMinus3YrEndwmtFundGrp": {
          "BeginningYearBalanceAmt": "2025624",
          "ContributionsAmt": "155656",
          "InvestmentEarningsOrLossesAmt": "57296",
          "EndYearBalanceAmt": "2238576"
        },
        "CYMinus4YrEndwmtFundGrp": {
          "BeginningYearBalanceAmt": "1846668",
          "ContributionsAmt": "154591",
          "InvestmentEarningsOrLossesAmt": "24365",
          "EndYearBalanceAmt": "2025624"
        },
        "BoardDesignatedBalanceEOYPct": "1.00000",
        "EndowmentsHeldUnrelatedOrgInd": "0",
        "EndowmentsHeldRelatedOrgInd": "0",
        "LandGrp": {
          "OtherCostOrOtherBasisAmt": "71416",
          "BookValueAmt": "71416"
        },
        "BuildingsGrp": {
          "OtherCostOrOtherBasisAmt": "434231",
          "DepreciationAmt": "250425",
          "BookValueAmt": "183806"
        },
        "EquipmentGrp": {
          "OtherCostOrOtherBasisAmt": "573792",
          "DepreciationAmt": "499452",
          "BookValueAmt": "74340"
        },
        "TotalBookValueLandBuildingsAmt": "329562",
        "OtherSecuritiesGrp": {
          "Desc": "UNITED STATES OLYMPIC ENDOWMENT POOLED FUNDS",
          "BookValueAmt": "1675308",
          "MethodValuationCd": "F"
        },
        "TotalBookValueSecuritiesAmt": "1675308",
        "FootnoteTextInd": "X",
        "TotalRevEtcAuditedFinclStmtAmt": "12223377",
        "NetUnrealizedGainsInvstAmt": "74617",
        "OtherRevenueAmt": "22692",
        "RevenueNotReportedAmt": "97309",
        "RevenueSubtotalAmt": "12126068",
        "RevenueNotReportedFinclStmtAmt": "0",
        "TotalRevenuePerForm990Amt": "12126068",
        "TotExpnsEtcAuditedFinclStmtAmt": "12508024",
        "OtherExpensesIncludedAmt": "22692",
        "ExpensesNotReportedAmt": "22692",
        "ExpensesSubtotalAmt": "12485332",
        "ExpensesNotRptFinclStmtAmt": "0",
        "TotalExpensesPerForm990Amt": "12485332",
        "SupplementalInformationDetail": [
          {
            "FormAndLineReferenceDesc": "PART V, LINE 4:",
            "ExplanationTxt": "IN PRIOR YEARS, THE BOARD OF DIRECTORS ESTABLISHED SEPARATE CASH AND INVESTMENT ACCOUNTS FOR THE PURPOSE OF CREATING AN OPERATING RESERVE AND A RESERVE FOR FUTURE INCREASES IN INSURANCE COSTS."
          },
          {
            "FormAndLineReferenceDesc": "PART X, LINE 2:",
            "ExplanationTxt": "THE CORPORATION QUALIFIES AS A TAX-EXEMPT ORGANIZATION UNDER SECTION 501(C)(3) OF THE INTERNAL REVENUE CODE AND, ACCORDINGLY, IS NOT SUBJECT TO FEDERAL INCOME TAX. ACCORDINGLY, NO INCOME TAX PROVISION HAS BEEN RECORDED. THE CORPORATIONS FORMS 990, RETURN OF ORGANIZATION EXEMPT FROM INCOME TAX, ARE SUBJECT TO EXAMINATION BY VARIOUS TAXING AUTHORITIES, GENERALLY FOR THREE YEARS AFTER THE DATE THEY WERE FILED. MANAGEMENT OF THE CORPORATION BELIEVES THAT IT DOES NOT HAVE ANY UNCERTAIN TAX POSITIONS THAT ARE MATERIAL TO THE FINANCIAL STATEMENTS."
          },
          {
            "FormAndLineReferenceDesc": "PART XI, LINE 2D - OTHER ADJUSTMENTS:",
            "ExplanationTxt": "FUNDRAISING INCOME IS SHOWN NET OF EXPENSE FOR REPORTING PURPOSES ON THE 990"
          },
          {
            "FormAndLineReferenceDesc": "PART XII, LINE 2D - OTHER ADJUSTMENTS:",
            "ExplanationTxt": "FUNDRAISING INCOME IS SHOWN NET OF EXPENSE FOR REPORTING PURPOSES ON THE 990"
          }
        ]
      },
      "IRS990ScheduleF": {
        "-documentId": "RetDoc1040500001",
        "GrantRecordsMaintainedInd": "1",
        "AccountActivitiesOutsideUSGrp": [
          {
            "RegionTxt": "ASIA",
            "OfficesCnt": "0",
            "EmployeeCnt": "0",
            "TypeOfActivitiesConductedTxt": "PROGRAM SERVICES",
            "SpecificServicesProvidedTxt": "PROVIDING SUPPORT FOR NATIONAL TEAM ATHLETES TO COMPETE AND TRAIN IN THE REGI",
            "RegionTotalExpendituresAmt": "205267"
          },
          {
            "RegionTxt": "EUROPE",
            "OfficesCnt": "0",
            "EmployeeCnt": "0",
            "TypeOfActivitiesConductedTxt": "PROGRAM SERVICES",
            "SpecificServicesProvidedTxt": "PROVIDING SUPPORT FOR NATIONAL TEAM ATHLETES TO COMPETE AND TRAIN IN THE REGI",
            "RegionTotalExpendituresAmt": "527731"
          },
          {
            "RegionTxt": "NORTH AMERICA",
            "OfficesCnt": "0",
            "EmployeeCnt": "0",
            "TypeOfActivitiesConductedTxt": "PROGRAM SERVICES",
            "SpecificServicesProvidedTxt": "PROVIDING SUPPORT FOR NATIONAL TEAM ATHLETES TO COMPETE AND TRAIN IN THE REGI",
            "RegionTotalExpendituresAmt": "100094"
          },
          {
            "RegionTxt": "SOUTH AMERICA",
            "OfficesCnt": "0",
            "EmployeeCnt": "0",
            "TypeOfActivitiesConductedTxt": "PROGRAM SERVICES",
            "SpecificServicesProvidedTxt": "PROVIDING SUPPORT FOR NATIONAL TEAM ATHLETES TO COMPETE AND TRAIN IN THE REGI",
            "RegionTotalExpendituresAmt": "17753"
          }
        ],
        "SubtotalOfficesCnt": "0",
        "SubtotalEmployeesCnt": "0",
        "ContinutationTotalOfficeCnt": "0",
        "ContinutationTotalEmployeeCnt": "0",
        "TotalOfficeCnt": "0",
        "TotalEmployeeCnt": "0",
        "SubtotalSpentAmt": "850845",
        "ContinuationSpentAmt": "0",
        "TotalSpentAmt": "850845",
        "GrantsToOrgOutsideUSGrp": {
          "RegionTxt": "ASIA",
          "PurposeOfGrantTxt": "COACHING SERVICES",
          "CashGrantAmt": "66000",
          "MannerOfCashDisbursementTxt": "WIRE TRANSFERS",
          "ValuationMethodUsedDesc": "FAIR MARKET VALUE"
        },
        "TransferToForeignCorpInd": "0",
        "InterestInForeignTrustInd": "0",
        "ForeignCorpOwnershipInd": "0",
        "PassiveForeignInvestmestCoInd": "0",
        "ForeignPartnershipInd": "0",
        "BoycottCountriesInd": "0",
        "SupplementalInformationDetail": {
          "FormAndLineReferenceDesc": "PART I, LINE 2:",
          "ExplanationTxt": "ACTIVITIES WERE FOR THE NORMAL COURSE OF BUSINESS AND WERE PROGRAM SERVICES EXPENSES RELATED TO NATIONAL TEAMS TOURS AND COMPETITIONS. NO GRANTS OR ASSITANCE WERE PAID, BUT HOTEL AND MEAL COSTS, ENTRY FEES, FILA LICENSES AND RELATED TRAVEL EXPENSES WERE PAID TO OR SPENT IN FOREIGN COUNTRIES. RECEIPTS, INVOICES OR OTHER DOCUMENTATION WERE OBTAINED FOR ALL EXPENSES, AND ALL EXPENSES WENT THROUGH OUR NORMAL SIGNING PROCESS OF APPROVAL BY DEPARTMENT HEAD, EXECUTIVE DIRECTOR, AND CFO."
        }
      },
      "IRS990ScheduleG": {
        "-documentId": "RetDoc1041300001",
        "FundraisingEventInformationGrp": {
          "NameOfEvent1Amt": "W CHAMPS PARTNERS",
          "GrossReceiptsEvent1Amt": "3400",
          "GrossRevenueEvent1Amt": "3400",
          "OtherDirectExpensesEvent1Amt": "1670",
          "NameOfEvent2Amt": "WR NATION/ANNUAL GIVING",
          "GrossReceiptsEvent2Amt": "37100",
          "CharitableContriEvent2Amt": "37100",
          "NonCashPrizesEvent2Amt": "760",
          "OtherDirectExpensesEvent2Amt": "262",
          "OtherEventsTotalCnt": "2",
          "GrossReceiptsOtherEventsAmt": "20000",
          "CharitableContriOtherEventsAmt": "20000",
          "RentFcltyCostsOtherEventsAmt": "17000",
          "OthDirectExpnssOtherEventsAmt": "3000",
          "GrossReceiptsTotalAmt": "60500",
          "CharitableContributionsTotAmt": "57100",
          "GrossRevenueTotalEventsAmt": "3400",
          "NonCashPrizesTotalEventsAmt": "760",
          "RentFcltyCostsTotalEventsAmt": "17000",
          "OthDirectExpnssTotalEventsAmt": "4932",
          "DirectExpenseSummaryEventsAmt": "22692",
          "NetIncomeSummaryAmt": "-19292"
        }
      },
      "IRS990ScheduleI": {
        "-documentId": "RetDoc1041900001",
        "GrantRecordsMaintainedInd": "1",
        "GrantsOtherAsstToIndivInUSGrp": {
          "GrantTypeTxt": "ATHLETE PAYMENTS",
          "RecipientCnt": "149",
          "CashGrantAmt": "641750",
          "ValuationMethodUsedDesc": "CASH"
        },
        "SupplementalInformationDetail": {
          "FormAndLineReferenceDesc": "FORM 990, SCHEDULE I, PART III",
          "ExplanationTxt": "USA WRESTLING DOES NOT PROVIDE GRANTS TO ORGANIZATIONS OR INDIVIDUALS. USA WRESTLING DOES PROVIDE OTHER ASSISTANCE TO INDIVIDUALS LIVING IN THE UNITED STATES. THESE PAYMENTS TO ATHLETES IN OUR SPORT ARE EARNED THROUGH DOCUMENTED COMPETITION PROCEDURES ANAD TRAINING CAMPS. AS MOST ASSISTANCE IS CONTRACTED STIPEND PAYMENTS OR PERFORMANCE-BASED BONUS PAYMENTS, USA WRESTLING DOES NOT MONITOR THE USE OF THE STIPEND OR BONUS PAYMENT."
        }
      },
      "IRS990ScheduleJ": {
        "-documentId": "RetDoc1042400001",
        "ClubDuesOrFeesInd": "X",
        "WrittenPolicyRefTAndEExpnssInd": "0",
        "SubstantiationRequiredInd": "1",
        "CompensationCommitteeInd": "X",
        "Form990OfOtherOrganizationsInd": "X",
        "BoardOrCommitteeApprovalInd": "X",
        "SeverancePaymentInd": "0",
        "SupplementalNonqualRtrPlanInd": "0",
        "EquityBasedCompArrngmInd": "0",
        "CompBasedOnRevenueOfFlngOrgInd": "0",
        "CompBsdOnRevRelatedOrgsInd": "0",
        "CompBsdNetEarnsFlngOrgInd": "0",
        "CompBsdNetEarnsRltdOrgsInd": "0",
        "AnyNonFixedPaymentsInd": "0",
        "InitialContractExceptionInd": "0",
        "RltdOrgOfficerTrstKeyEmplGrp": [
          {
            "PersonNm": "RICHARD BENDER",
            "TitleTxt": "EXECUTIVE DIRECTOR",
            "BaseCompensationFilingOrgAmt": "204488",
            "CompensationBasedOnRltdOrgsAmt": "0",
            "BonusFilingOrganizationAmount": "35000",
            "BonusRelatedOrganizationsAmt": "0",
            "OtherCompensationFilingOrgAmt": "5985",
            "OtherCompensationRltdOrgsAmt": "0",
            "DeferredCompensationFlngOrgAmt": "11974",
            "DeferredCompRltdOrgsAmt": "0",
            "NontaxableBenefitsFilingOrgAmt": "2000",
            "NontaxableBenefitsRltdOrgsAmt": "0",
            "TotalCompensationFilingOrgAmt": "259447",
            "TotalCompensationRltdOrgsAmt": "0",
            "CompReportPrior990FilingOrgAmt": "0",
            "CompReportPrior990RltdOrgsAmt": "0"
          },
          {
            "PersonNm": "DWAINE COOPER",
            "TitleTxt": "ASSOC EXECUTIVE DIRECTOR",
            "BaseCompensationFilingOrgAmt": "142300",
            "CompensationBasedOnRltdOrgsAmt": "0",
            "BonusFilingOrganizationAmount": "2600",
            "BonusRelatedOrganizationsAmt": "0",
            "OtherCompensationFilingOrgAmt": "0",
            "OtherCompensationRltdOrgsAmt": "0",
            "DeferredCompensationFlngOrgAmt": "7245",
            "DeferredCompRltdOrgsAmt": "0",
            "NontaxableBenefitsFilingOrgAmt": "1000",
            "NontaxableBenefitsRltdOrgsAmt": "0",
            "TotalCompensationFilingOrgAmt": "153145",
            "TotalCompensationRltdOrgsAmt": "0",
            "CompReportPrior990FilingOrgAmt": "0",
            "CompReportPrior990RltdOrgsAmt": "0"
          },
          {
            "PersonNm": "LARRY L JONES JR",
            "TitleTxt": "NATIONAL FREESTYLE COACH",
            "BaseCompensationFilingOrgAmt": "170000",
            "CompensationBasedOnRltdOrgsAmt": "0",
            "BonusFilingOrganizationAmount": "5100",
            "BonusRelatedOrganizationsAmt": "0",
            "OtherCompensationFilingOrgAmt": "0",
            "OtherCompensationRltdOrgsAmt": "0",
            "DeferredCompensationFlngOrgAmt": "8755",
            "DeferredCompRltdOrgsAmt": "0",
            "NontaxableBenefitsFilingOrgAmt": "2000",
            "NontaxableBenefitsRltdOrgsAmt": "0",
            "TotalCompensationFilingOrgAmt": "185855",
            "TotalCompensationRltdOrgsAmt": "0",
            "CompReportPrior990FilingOrgAmt": "0",
            "CompReportPrior990RltdOrgsAmt": "0"
          }
        ],
        "SupplementalInformationDetail": [
          {
            "FormAndLineReferenceDesc": "PART I, LINE 1A",
            "ExplanationTxt": "THE ORGANIZATION PAYS MONTHLY DUES FOR A CORPORATE MEMBERSHIP ON BEHALF OF THE EXECUTIVE DIRECTOR. ANY PERSONAL CHARGES ARE REIMBURSED TO THE ORGANIZATION. THE MONTHLY DUES ARE REPORTED AS TAXABLE COMPENSATION ON THE EXECUTIVE DIRECTORS W-2."
          },
          {
            "FormAndLineReferenceDesc": "PART I, LINE 1B",
            "ExplanationTxt": "MONTHLY STATEMENTS ARE RECEIVED BY THE ORGANIZATION AND THE EXECUTIVE DIRECTOR REVIEWS THE CHARGES AND DOCUMENTS WHICH ITEMS ARE BUSINESS EXPENSES AND THE NATURE OF THE EXPENSE. ANY PERSONAL EXPENSES ARE REIMBURSED."
          }
        ]
      },
      "IRS990ScheduleM": {
        "-documentId": "RetDoc1042900001",
        "OtherNonCashContriTableGrp": [
          {
            "NonCashCheckboxInd": "X",
            "Desc": "APPAREL & EQU",
            "ContributionCnt": "1",
            "NoncashContributionsRptF990Amt": "254282",
            "MethodOfDeterminingRevenuesTxt": "DEALER COST"
          },
          {
            "NonCashCheckboxInd": "X",
            "Desc": "AIRLINE VIK",
            "ContributionCnt": "1",
            "NoncashContributionsRptF990Amt": "78527",
            "MethodOfDeterminingRevenuesTxt": "ESTIMATED MARKET VAL"
          }
        ],
        "AnyPropertyThatMustBeHeldInd": "0",
        "ReviewProcessUnusualNCGiftsInd": "1",
        "ThirdPartiesUsedInd": "0",
        "SupplementalInformationDetail": {
          "FormAndLineReferenceDesc": "PART I, COLUMN (B):",
          "ExplanationTxt": "THE NUMBER OF CONTRIBUTORS RELATES TO THE ACTUAL NUMBER OF CONTRIBUTORS DURING THE YEAR."
        }
      },
      "IRS990ScheduleO": {
        "-documentId": "RetDoc1044400001",
        "SupplementalInformationDetail": [
          {
            "FormAndLineReferenceDesc": "FORM 990, PART III, LINE 2",
            "ExplanationTxt": "THE SPORT DEVELOPMENT/BROADCASTING PROGRAM PROMOTES USA WRESTLING BY DEVELOPING OPPORTUNITIES IN BROADCASTING, TELEVISION, SOCIAL MEDIA, BRANDING, AND OTHER AREAS."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART III, LINE 3",
            "ExplanationTxt": "THE KEEP WRESTLING IN THE OLYMPICS PROGRAM CEASED OPERATING DURING THE FISCAL YEAR."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART VI, SECTION A, LINE 2",
            "ExplanationTxt": "DAVE BLACK OF WISCONSIN SERVES ON THE BOARD OF DIRECTORS. HIS SON, TONY BLACK, IS AN EMPLOYEE OF THE ORGANIZATION. PATRICIA FOX SERVES ON THE BOARD OF DIRECTORS. HER HUSBAND, GARY ABBOTT IS AN EMPLOYEE, DIRECTOR OF SPECIAL PROJECTS, OF THE ORGANIZATION."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART VI, SECTION A, LINE 6",
            "ExplanationTxt": "THE ORGANIZATION IS A MEMBERSHIP ORGANIZATION."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART VI, SECTION A, LINE 7A",
            "ExplanationTxt": "MEMBERS MAY ELECT MEMBERS OF THE BOARD OF DIRECTORS."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART VI, SECTION B, LINE 11",
            "ExplanationTxt": "A DRAFT OF THE 990 IS PROVIDED TO STAFF FOR REVIEW; AFTER STAFF REVIEW, THE DRAFT OF THE 990 IS PRESENTED TO THE TREASURER FOR REVIEW. AFTER TREASURER REVIEW, THE 990 IS FINALIZED AND SENT TO THE TREASURER FOR SIGNATURE. THE TREASURER WILL THEN RETURN THE 990 TO THE ORGANIZATION. THE 990 WILL BE FILED WITH THE IRS AFTER COPIES OF THE SIGNED FORMS ARE OBTAINED. THE FORM 990 IS MADE AVAILABLE TO OTHER BOARD MEMBERS, UPON APPROVAL OF THE RETURN BY THE TREASURER, ON THE ORGANIZATIONS WEBSITE."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART VI, SECTION B, LINE 12C",
            "ExplanationTxt": "BOARD OF DIRECTORS AND EMPLOYEES ARE REQUIRED TO SIGN A CONFLICT OF INTEREST POLICY ANNUALLY."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART VI, SECTION B, LINE 15A",
            "ExplanationTxt": "THE EXECUTIVE DIRECTORS COMPENSATION IS REVIEWED BY A SUBCOMMITTEE OF THE BOARD OF DIRECTORS, WITH COMPARABILITY DATA."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART VI, SECTION C, LINE 18",
            "ExplanationTxt": "FORMS 990 AND 990-T ARE AVAILABLE ON THE ORGANIZATIONS WEBSITE OR UPON REQUEST AT THE NATIONAL OFFICE DURING NORMAL BUSINESS HOURS."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART VI, SECTION C, LINE 19",
            "ExplanationTxt": "MISSION, VISION, AND VALUES; ORGANIZATIONAL BY-LAWS; LONG RANGE PLAN; LISTS OF STAFF, BOARD MEMBERS AND BOARD COMMITTEE MEMBERS POSTED ON OUR WEBSITE, AS ARE OUR AUDITED FINANCIAL STATEMENTS AND FORMS 990 AND 990T FOR THE LAST THREE YEARS. CONFLICT OF INTEREST POLICY, OTHER THAN AS STATED IN BY-LAWS, IS NOT POSTED."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART VII, PAGE 7",
            "ExplanationTxt": "THE TOTAL NUMBER OF INDEPENDENT MEMBERS OF THE BOARD OF DIRECTORS AT AUGUST 31, 2014 IS 35. THERE ARE ADDITIONAL MEMBERS LISTED ON THE SCHEDULE OF COMPENSATION OF OFFICERS, DIRECTORS, TRUSTEES, KEY EMPLOYEES, HIGHEST COMPENSATED EMPLOYEES, AND INDEPENDENT CONTRACTORS DUE TO TURNOVER IN POSITIONS ON THE BOARD DURING THE YEAR AFTER ELECTIONS WERE HELD."
          },
          {
            "FormAndLineReferenceDesc": "FORM 990, PART XII, PAGE 12, LINE 2C",
            "ExplanationTxt": "THIS PROCESS HAS NOT CHANGED FROM THE PRIOR YEAR."
          }
        ]
      },
      "IRS990ScheduleR": {
        "-documentId": "RetDoc1043400001",
        "IdRelatedTaxExemptOrgGrp": {
          "DisregardedEntityName": { "BusinessNameLine1": "UNITED STATES OLYMPIC COMMITTEE" },
          "USAddress": {
            "AddressLine1": "ONE OLYMPIC PLAZA",
            "City": "COLORADO SPRINGS",
            "State": "CO",
            "ZIPCode": "80909"
          },
          "EIN": "131548339",
          "PrimaryActivitiesTxt": "OLYMPIC ATHLETE DEVELOPMENT",
          "LegalDomicileStateCd": "CO",
          "ExemptCodeSectionTxt": "501(C)(3)",
          "PublicCharityStatusTxt": "170(B)(1)(A)",
          "DirectControllingNACd": "N/A",
          "ControlledOrganizationInd": "0"
        },
        "ReceiptOfIntAnntsRntsRyltsInd": "0",
        "GiftGrntOrCapContriToOthOrgInd": "0",
        "GiftGrntCapContriFromOthOrgInd": "1",
        "LoansOrGuaranteesToOtherOrgInd": "0",
        "LoansOrGuaranteesFromOthOrgInd": "0",
        "DivRelatedOrganizationInd": "0",
        "AssetSaleToOtherOrgInd": "0",
        "AssetPurchaseFromOtherOrgInd": "0",
        "AssetExchangeInd": "0",
        "RentalOfFacilitiesToOthOrgInd": "0",
        "RentalOfFcltsFromOthOrgInd": "0",
        "PerformOfServicesForOthOrgInd": "0",
        "PerformOfServicesByOtherOrgInd": "0",
        "SharingOfFacilitiesInd": "0",
        "PaidEmployeesSharingInd": "0",
        "ReimbursementPaidToOtherOrgInd": "0",
        "ReimbursementPaidByOtherOrgInd": "0",
        "TransferToOtherOrgInd": "0",
        "TransferFromOtherOrgInd": "0",
        "TransactionsRelatedOrgGrp": [
          {
            "OtherOrganizationName": { "BusinessNameLine1": "UNITED STATES OLYMPIC COMMITTEE" },
            "TransactionTypeTxt": "C",
            "InvolvedAmt": "1514090",
            "MethodOfAmountDeterminationTxt": "CASH"
          },
          {
            "OtherOrganizationName": { "BusinessNameLine1": "UNITED STATES OLYMPIC COMMITTEE" },
            "TransactionTypeTxt": "C",
            "InvolvedAmt": "78527",
            "MethodOfAmountDeterminationTxt": "FMV OF AIRLINE CERTS"
          }
        ]
      }
    }
  }
}
'
object = JSON.parse(value) # => {"val"=>"test","val1"=>"test1","val2"=>"test2"}
data = Hashie::Mash.new object

name = data["Return"]["ReturnHeader"]["Filer"]["BusinessName"]["BusinessNameLine1"]
mission = data["Return"]["ReturnData"]["IRS990"]["ActivityOrMissionDesc"]
#We probably need to parse this out over a couple pieces in one string 
address1 = data["Return"]["ReturnHeader"]["Filer"]["USAddress"]["AddressLine1"]
address2 = data["Return"]["ReturnHeader"]["Filer"]["USAddress"]["City"]
address3 = data["Return"]["ReturnHeader"]["Filer"]["USAddress"]["State"]
address4 = data["Return"]["ReturnHeader"]["Filer"]["USAddress"]["ZIPCode"]

year_formed = data["Return"]["ReturnData"]["IRS990"]["FormationYr"]
number_of_employees = data["Return"]["ReturnData"]["IRS990"]["TotalEmployeeCnt"]
domain = data["Return"]["ReturnData"]["IRS990"]["WebsiteAddressTxt"]
address = address1 + " " + address2 + " " + address3 + " " + address4



# json = ActiveSupport::JSON.decode(File.read('example2.json'))

# json.each do |a|
#   Organisation.create!(['country'], without_protection: true)
# end

org = Organisation.create(
  name: name,
  mission: mission,
  address: address,
  year_formed: year_formed,
  number_of_employees: number_of_employees,
  domain: domain
  )














