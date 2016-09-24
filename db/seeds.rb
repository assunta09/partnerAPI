# require_relative 'example2'
require 'nokogiri'
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

#This the new seeds area. I'm testing the first script 
#for parsing the json file. See below: 

# object = JSON.parse(value) # => {"val"=>"test","val1"=>"test1","val2"=>"test2"}
# data = Hashie::Mash.new object

# name = data["Return"]["ReturnHeader"]["Filer"]["BusinessName"]["BusinessNameLine1"]
# mission = data["Return"]["ReturnData"]["IRS990"]["ActivityOrMissionDesc"]
# #We probably need to parse this out over a couple pieces in one string 
# address1 = data["Return"]["ReturnHeader"]["Filer"]["USAddress"]["AddressLine1"]
# address2 = data["Return"]["ReturnHeader"]["Filer"]["USAddress"]["City"]
# address3 = data["Return"]["ReturnHeader"]["Filer"]["USAddress"]["State"]
# address4 = data["Return"]["ReturnHeader"]["Filer"]["USAddress"]["ZIPCode"]

# year_formed = data["Return"]["ReturnData"]["IRS990"]["FormationYr"]
# number_of_employees = data["Return"]["ReturnData"]["IRS990"]["TotalEmployeeCnt"]
# domain = data["Return"]["ReturnData"]["IRS990"]["WebsiteAddressTxt"]
# address = address1 + " " + address2 + " " + address3 + " " + address4



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

#This is the new script for reading an xml file, parsing, and creating a 
# ruby hash. 

file = File.open("201510099349300436_public.xml")
xml_file = File.read(file)
doc = Nokogiri::XML(xml_file)
leaves = doc.xpath('//*[not(*)]')

hash = {}
leaves.each do |node|
  hash["#{node.name}"] = node.text
end

#Table data 
# create_table :organisations do |t|
#       t.string :name
#       t.text :mission
#       t.string :address
#       t.integer :year_formed
#       t.integer :number_of_employees
#       t.string :domain

# #       t.timestamps

# This is the runner data 

# puts hash["BusinessNameLine1"] 
# puts hash["ActivityOrMissionDesc"]
# puts hash["AddressLine1"]
# puts hash["City"]
# puts hash["State"]
# puts hash["ZIPCode"]
# puts hash["TypeOfOrganizationCorpInd"]
# puts hash["TotalEmployeeCnt"]
# puts hash["WebsiteAddressTxt"]












