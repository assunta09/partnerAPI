# require_relative 'example2'

# require 'crack'
require 'json'
require 'hashie'
require 'awesome_print'
# require 'activesupport'

Organisation.delete_all
Revenue.delete_all
Expense.delete_all
Executive.delete_all
Balance.delete_all
Year.delete_all

org = Organisation.create(
  name: "Devbootcamp",
  mission: "Make beautiful and meaningful shit",
  address: "633 Folsom St.",
  year_formed: 2016,
  number_of_employees: 1337,
  domain: "Devbootcamp.com"
  )

year = Year.create(
  year: 2016)

Revenue.create(
  organisation_id: org.id,
  year_id: year.id,
  contributions: 5,
  service_revenue: 5,
  investments: 5,
  other: 5,
  total: 20)

Expense.create(
  organisation_id: org.id,
  year_id: year.id,
  grants: 10,
  member_benefits: 20,
  salaries: 20,
  fundraising_fees: 20,
  total: 70
  )

Executive.create(
  organisation_id: org.id,
  name: "Tedmund Chua",
  salary: 9999999
  )

Balance.create(
  organisation_id: org.id,
  year_id: year.id,
  total_assets: 500,
  total_liabilities: 400,
  net_assets: 100
  )

#This the new seeds area. I'm testing a script 
#for parsing the json file. See below: 

value = '{
  "Return": {
    "-xmlns": "http://www.irs.gov/efile",
    "-returnVersion": "2014v5.0",
    "ReturnHeader": {
      "-binaryAttachmentCnt": "0",
      "ReturnTs": "2015-08-14T14:48:22-04:00",
      "TaxPeriodEndDt": "2014-12-31",
      "PreparerFirmGrp": {
        "PreparerFirmEIN": "202929389",
        "PreparerFirmName": { "BusinessNameLine1Txt": "Gilbert Accounting & Tax Service" },
        "PreparerUSAddress": {
          "AddressLine1Txt": "925-D Wappoo road",
          "CityNm": "Charleston",
          "StateAbbreviationCd": "SC",
          "ZIPCd": "29407"
        }
      },
      "ReturnTypeCd": "990",
      "TaxPeriodBeginDt": "2014-01-01",
      "Filer": {
        "EIN": "202711563",
        "BusinessName": { "BusinessNameLine1Txt": "Remember" },
        "BusinessNameControlTxt": "REME",
        "USAddress": {
          "AddressLine1Txt": "834 Wappoo road",
          "CityNm": "Charleston",
          "StateAbbreviationCd": "SC",
          "ZIPCd": "29407"
        }
      },
      "BusinessOfficerGrp": {
        "PersonNm": "Curtis E Bostic",
        "PersonTitleTxt": "Vice President",
        "PhoneNum": "8434087848",
        "SignatureDt": "2015-05-14",
        "DiscussWithPaidPreparerInd": "true"
      },
      "PreparerPersonGrp": {
        "PreparerPersonNm": "Mark Gilbert",
        "PTIN": "P00005033",
        "PhoneNum": "8435716497",
        "PreparationDt": "2015-08-14",
        "SelfEmployedInd": "X"
      },
      "TaxYr": "2014",
      "BuildTS": "2016-02-25 16:41:14Z"
    },
    "ReturnData": {
      "-documentCnt": "5",
      "IRS990": {
        "-documentId": "IRS990",
        "PrincipalOfficerNm": "Curtis E Bostic",
        "GrossReceiptsAmt": "385189",
        "GroupReturnForAffiliatesInd": "false",
        "Organization501c3Ind": "X",
        "WebsiteAddressTxt": "http://REMEMBERTHOSE.ORG/",
        "TypeOfOrganizationCorpInd": "X",
        "FormationYr": "2005",
        "LegalDomicileStateCd": "SC",
        "ActivityOrMissionDesc": "Provide educational and health services to christians around the globe who are persecuted by others because of thier religious beliefs.",
        "VotingMembersGoverningBodyCnt": "11",
        "VotingMembersIndependentCnt": "11",
        "TotalEmployeeCnt": "0",
        "TotalGrossUBIAmt": "89",
        "NetUnrelatedBusTxblIncmAmt": "0",
        "PYContributionsGrantsAmt": "148925",
        "CYContributionsGrantsAmt": "385100",
        "CYProgramServiceRevenueAmt": "0",
        "CYInvestmentIncomeAmt": "89",
        "CYOtherRevenueAmt": "0",
        "PYTotalRevenueAmt": "148925",
        "CYTotalRevenueAmt": "385189",
        "PYGrantsAndSimilarPaidAmt": "133303",
        "CYGrantsAndSimilarPaidAmt": "0",
        "CYBenefitsPaidToMembersAmt": "0",
        "CYSalariesCompEmpBnftPaidAmt": "0",
        "CYTotalProfFndrsngExpnsAmt": "0",
        "CYTotalFundraisingExpenseAmt": "0",
        "PYOtherExpensesAmt": "11572",
        "CYOtherExpensesAmt": "27241",
        "PYTotalExpensesAmt": "144875",
        "CYTotalExpensesAmt": "27241",
        "PYRevenuesLessExpensesAmt": "4050",
        "CYRevenuesLessExpensesAmt": "357948",
        "TotalAssetsBOYAmt": "109836",
        "TotalAssetsEOYAmt": "467784",
        "TotalLiabilitiesEOYAmt": "0",
        "NetAssetsOrFundBalancesBOYAmt": "109836",
        "NetAssetsOrFundBalancesEOYAmt": "467784",
        "MissionDesc": "Provide educational and health services to christians around the globe who are persecuted by others because of thier religious beliefs.",
        "SignificantNewProgramSrvcInd": "false",
        "SignificantChangeInd": "false",
        "ExpenseAmt": "6093",
        "Desc": "Provide educational and health services around the globe.",
        "TotalProgramServiceExpensesAmt": "6093",
        "DescribedInSection501c3Ind": {
          "-referenceDocumentId": "990A",
          "#text": "true"
        },
        "ScheduleBRequiredInd": "false",
        "PoliticalCampaignActyInd": "false",
        "LobbyingActivitiesInd": "false",
        "SubjectToProxyTaxInd": "false",
        "DonorAdvisedFundInd": "false",
        "ConservationEasementsInd": "false",
        "CollectionsOfArtInd": "false",
        "CreditCounselingInd": "false",
        "TempOrPermanentEndowmentsInd": "false",
        "ReportLandBuildingEquipmentInd": {
          "-referenceDocumentId": "990D",
          "#text": "true"
        },
        "ReportInvestmentsOtherSecInd": "false",
        "ReportProgramRelatedInvstInd": "false",
        "ReportOtherAssetsInd": "false",
        "ReportOtherLiabilitiesInd": "false",
        "IncludeFIN48FootnoteInd": "false",
        "IndependentAuditFinclStmtInd": "false",
        "ConsolidatedAuditFinclStmtInd": "false",
        "SchoolOperatingInd": "false",
        "ForeignOfficeInd": "false",
        "ForeignActivitiesInd": "false",
        "MoreThan5000KToOrgInd": "false",
        "MoreThan5000KToIndividualsInd": "false",
        "ProfessionalFundraisingInd": "false",
        "FundraisingActivitiesInd": {
          "-referenceDocumentId": "990G",
          "#text": "true"
        },
        "GamingActivitiesInd": "false",
        "OperateHospitalInd": "false",
        "GrantsToOrganizationsInd": "false",
        "GrantsToIndividualsInd": "false",
        "ScheduleJRequiredInd": "false",
        "TaxExemptBondsInd": "false",
        "EngagedInExcessBenefitTransInd": "false",
        "PYExcessBenefitTransInd": "false",
        "LoanOutstandingInd": "false",
        "GrantToRelatedPersonInd": "false",
        "BusinessRlnWithOrgMemInd": "false",
        "BusinessRlnWithFamMemInd": "false",
        "BusinessRlnWithOfficerEntInd": "false",
        "DeductibleNonCashContriInd": "false",
        "DeductibleArtContributionInd": "false",
        "TerminateOperationsInd": "false",
        "PartialLiquidationInd": "false",
        "DisregardedEntityInd": "false",
        "RelatedEntityInd": "false",
        "RelatedOrganizationCtrlEntInd": "false",
        "TransactionWithControlEntInd": "false",
        "TrnsfrExmptNonChrtblRltdOrgInd": "false",
        "ActivitiesConductedPrtshpInd": "false",
        "ScheduleORequiredInd": "true",
        "IRPDocumentCnt": "0",
        "IRPDocumentW2GCnt": "0",
        "BackupWthldComplianceInd": "false",
        "EmployeeCnt": "0",
        "EmploymentTaxReturnsFiledInd": "false",
        "UnrelatedBusIncmOverLimitInd": "false",
        "ForeignFinancialAccountInd": "false",
        "ProhibitedTaxShelterTransInd": "false",
        "TaxablePartyNotificationInd": "false",
        "NondeductibleContributionsInd": "false",
        "QuidProQuoContributionsInd": "false",
        "Form8282PropertyDisposedOfInd": "false",
        "RcvFndsToPayPrsnlBnftCntrctInd": "false",
        "PayPremiumsPrsnlBnftCntrctInd": "false",
        "Form8899Filedind": "false",
        "Form1098CFiledInd": "false",
        "DAFExcessBusinessHoldingsInd": "false",
        "TaxableDistributionsInd": "false",
        "DistributionToDonorInd": "false",
        "IndoorTanningServicesInd": "false",
        "InfoInScheduleOPartVIInd": "X",
        "GoverningBodyVotingMembersCnt": "11",
        "IndependentVotingMemberCnt": "11",
        "FamilyOrBusinessRlnInd": "false",
        "DelegationOfMgmtDutiesInd": "false",
        "ChangeToOrgDocumentsInd": "false",
        "MaterialDiversionOrMisuseInd": "false",
        "MembersOrStockholdersInd": "false",
        "ElectionOfBoardMembersInd": "false",
        "DecisionsSubjectToApprovaInd": "false",
        "MinutesOfGoverningBodyInd": "true",
        "MinutesOfCommitteesInd": "true",
        "OfficerMailingAddressInd": "false",
        "LocalChaptersInd": "false",
        "Form990ProvidedToGvrnBodyInd": "false",
        "ConflictOfInterestPolicyInd": "false",
        "WhistleblowerPolicyInd": "false",
        "DocumentRetentionPolicyInd": "false",
        "CompensationProcessCEOInd": "false",
        "CompensationProcessOtherInd": "false",
        "InvestmentInJointVentureInd": "false",
        "WrittenPolicyOrProcedureInd": "false",
        "UponRequestInd": "X",
        "BooksInCareOfDetail": {
          "PersonNm": "Curtis E Bostic",
          "PhoneNum": "8434087848",
          "USAddress": {
            "AddressLine1Txt": "834 Wappoo road",
            "CityNm": "Charleston",
            "StateAbbreviationCd": "SC",
            "ZIPCd": "29407"
          }
        },
        "NoListedPersonsCompensatedInd": "X",
        "Form990PartVIISectionAGrp": [
          {
            "PersonNm": "Curtis E Bostic",
            "TitleTxt": "Vice President",
            "AverageHoursPerWeekRt": "7.00",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "Danielle Walker",
            "TitleTxt": "Treasurer",
            "AverageHoursPerWeekRt": "14.00",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "Diana Glupker",
            "TitleTxt": "Secretary",
            "AverageHoursPerWeekRt": "2.00",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "Merritt R Jackson",
            "TitleTxt": "President",
            "AverageHoursPerWeekRt": "7.00",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "Edgar Freghaly",
            "TitleTxt": "Board Member",
            "AverageHoursPerWeekRt": "7.00",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "Robert Clifford",
            "TitleTxt": "board Member",
            "AverageHoursPerWeekRt": "3.00",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "Chris Mclain",
            "TitleTxt": "Board Member",
            "AverageHoursPerWeekRt": "3.00",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "Rhett Harter",
            "TitleTxt": "Board Member",
            "AverageHoursPerWeekRt": "3.00",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "Jay Marshall",
            "TitleTxt": "Board Member",
            "AverageHoursPerWeekRt": "3.00",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "Gabriel Waddell",
            "TitleTxt": "Board Member",
            "AverageHoursPerWeekRt": "2.00",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          },
          {
            "PersonNm": "Mark Searcy",
            "TitleTxt": "Board Member",
            "AverageHoursPerWeekRt": "0.50",
            "AverageHoursPerWeekRltdOrgRt": "0.00",
            "OfficerInd": "X",
            "ReportableCompFromOrgAmt": "0",
            "ReportableCompFromRltdOrgAmt": "0",
            "OtherCompensationAmt": "0"
          }
        ],
        "TotalReportableCompFromOrgAmt": "0",
        "TotReportableCompRltdOrgAmt": "0",
        "TotalOtherCompensationAmt": "0",
        "IndivRcvdGreaterThan100KCnt": "0",
        "FormerOfcrEmployeesListedInd": "false",
        "TotalCompGreaterThan150KInd": "false",
        "CompensationFromOtherSrcsInd": "false",
        "FundraisingAmt": "385100",
        "TotalContributionsAmt": "385100",
        "InvestmentIncomeGrp": {
          "TotalRevenueColumnAmt": "89",
          "UnrelatedBusinessRevenueAmt": "89"
        },
        "ContriRptFundraisingEventAmt": "385100",
        "TotalRevenueGrp": {
          "TotalRevenueColumnAmt": "385189",
          "RelatedOrExemptFuncIncomeAmt": "0",
          "UnrelatedBusinessRevenueAmt": "89",
          "ExclusionAmt": "0"
        },
        "FeesForServicesAccountingGrp": {
          "TotalAmt": "450",
          "ManagementAndGeneralAmt": "450"
        },
        "AdvertisingGrp": {
          "TotalAmt": "10224",
          "ManagementAndGeneralAmt": "10224"
        },
        "OfficeExpensesGrp": {
          "TotalAmt": "3242",
          "ManagementAndGeneralAmt": "3242"
        },
        "InformationTechnologyGrp": {
          "TotalAmt": "54",
          "ManagementAndGeneralAmt": "54"
        },
        "TravelGrp": {
          "TotalAmt": "21",
          "ManagementAndGeneralAmt": "21"
        },
        "InterestGrp": {
          "TotalAmt": "262",
          "ManagementAndGeneralAmt": "262"
        },
        "DepreciationDepletionGrp": {
          "TotalAmt": "5139",
          "ProgramServicesAmt": "5139"
        },
        "OtherExpensesGrp": [
          {
            "Desc": "Bank Fees",
            "TotalAmt": "5384",
            "ManagementAndGeneralAmt": "5384"
          },
          {
            "Desc": "Postage",
            "TotalAmt": "1215",
            "ManagementAndGeneralAmt": "1215"
          },
          {
            "Desc": "Website",
            "TotalAmt": "954",
            "ProgramServicesAmt": "954"
          }
        ],
        "AllOtherExpensesGrp": {
          "TotalAmt": "296",
          "ManagementAndGeneralAmt": "296"
        },
        "TotalFunctionalExpensesGrp": {
          "TotalAmt": "27241",
          "ProgramServicesAmt": "6093",
          "ManagementAndGeneralAmt": "21148",
          "FundraisingAmt": "0"
        },
        "CashNonInterestBearingGrp": {
          "BOYAmt": "108991",
          "EOYAmt": "93749"
        },
        "AccountsReceivableGrp": { "EOYAmt": "1980" },
        "LandBldgEquipCostOrOtherBssAmt": "377453",
        "LandBldgEquipAccumDeprecAmt": "5398",
        "LandBldgEquipBasisNetGrp": { "EOYAmt": "372055" },
        "OtherAssetsTotalGrp": { "BOYAmt": "845" },
        "TotalAssetsGrp": {
          "BOYAmt": "109836",
          "EOYAmt": "467784"
        },
        "TotalLiabilitiesGrp": {
          "BOYAmt": "0",
          "EOYAmt": "0"
        },
        "OrgDoesNotFollowSFAS117Ind": "X",
        "RtnEarnEndowmentIncmOthFndsGrp": {
          "BOYAmt": "109836",
          "EOYAmt": "467784"
        },
        "TotalNetAssetsFundBalanceGrp": {
          "BOYAmt": "109836",
          "EOYAmt": "467784"
        },
        "TotLiabNetAssetsFundBalanceGrp": {
          "BOYAmt": "109836",
          "EOYAmt": "467784"
        },
        "ReconcilationRevenueExpnssAmt": "357948",
        "OtherChangesInNetAssetsAmt": "0",
        "MethodOfAccountingCashInd": "X",
        "AccountantCompileOrReviewInd": "false",
        "FSAuditedInd": "false",
        "FederalGrantAuditRequiredInd": "false"
      },
      "IRS990ScheduleA": {
        "-documentId": "990A",
        "PublicOrganization170Ind": "X",
        "GiftsGrantsContriRcvd170Grp": {
          "CurrentTaxYearMinus4YearsAmt": "85540",
          "CurrentTaxYearMinus3YearsAmt": "147317",
          "CurrentTaxYearMinus2YearsAmt": "158055",
          "CurrentTaxYearMinus1YearAmt": "148656",
          "CurrentTaxYearAmt": "385189",
          "TotalAmt": "924757"
        },
        "TotalCalendarYear170Grp": {
          "CurrentTaxYearMinus4YearsAmt": "85540",
          "CurrentTaxYearMinus3YearsAmt": "147317",
          "CurrentTaxYearMinus2YearsAmt": "158055",
          "CurrentTaxYearMinus1YearAmt": "148656",
          "CurrentTaxYearAmt": "385189",
          "TotalAmt": "924757"
        },
        "SubstantialContributorsTotAmt": "95562",
        "PublicSupportTotal170Amt": "829195",
        "GrossInvestmentIncome170Grp": {
          "CurrentTaxYearMinus4YearsAmt": "27",
          "CurrentTaxYearMinus3YearsAmt": "3619",
          "CurrentTaxYearMinus2YearsAmt": "722",
          "CurrentTaxYearMinus1YearAmt": "269",
          "CurrentTaxYearAmt": "89",
          "TotalAmt": "4726"
        },
        "TotalSupportAmt": "929483",
        "PublicSupportCY170Pct": "0.89210",
        "PublicSupportPY170Pct": "0.99000",
        "ThirtyThrPctSuprtTestsCY170Ind": "X"
      },
      "IRS990ScheduleD": {
        "-documentId": "990D",
        "BuildingsGrp": {
          "InvestmentCostOrOtherBasisAmt": "374867",
          "DepreciationAmt": "5139",
          "BookValueAmt": "369728"
        },
        "OtherLandBuildingsGrp": {
          "InvestmentCostOrOtherBasisAmt": "2586",
          "DepreciationAmt": "259",
          "BookValueAmt": "2327"
        },
        "TotalBookValueLandBuildingsAmt": "372055"
      },
      "IRS990ScheduleG": {
        "-documentId": "990G",
        "FundraisingEventInformationGrp": {
          "Event1Nm": "Burma",
          "GrossReceiptsEvent1Amt": "260012",
          "GrossRevenueEvent1Amt": "260012",
          "GrossReceiptsTotalAmt": "260012",
          "GrossRevenueTotalEventsAmt": "260012",
          "NetIncomeSummaryAmt": "260012"
        }
      },
      "IRS990ScheduleO": {
        "-documentId": "990O",
        "SupplementalInformationDetail": [
          {
            "FormAndLineReferenceDesc": "Form 990 governing body review Part VI line 11",
            "ExplanationTxt": "Committee has review the return"
          },
          {
            "FormAndLineReferenceDesc": "Governing documents etc available to public Part VI line 19",
            "ExplanationTxt": "Documents are avaible upon written request"
          }
        ]
      }
    }
  }
}
'
object = JSON.parse(value) # => {"val"=>"test","val1"=>"test1","val2"=>"test2"}
data = Hashie::Mash.new object

name = data["Return"]["ReturnHeader"]["Filer"]["BusinessName"]["BusinessNameLine1Txt"]
mission = data["Return"]["ReturnData"]["IRS990"]["ActivityOrMissionDesc"]
#We probably need to parse this out over a couple pieces in one string 
address = data["Return"]["ReturnHeader"]["Filer"]["BusinessName"]["USAddress"]
year_formed = data["Return"]["ReturnData"]["IRS990"]["FormationYr"]
number_of_employees = data["Return"]["ReturnData"]["IRS990"]["TotalEmployeeCnt"]
domain = data["Return"]["ReturnData"]["IRS990"]["WebsiteAddressTxt"]



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














