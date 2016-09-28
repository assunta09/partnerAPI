require 'json'
require 'csv'
require_relative 'index_2015'

file = File.read("index_2015.json")
p file
# data = JSON.parse(file)
# json = data["Filings2015"]


# json.each do |hash|
#   masterfile = Masterfile.find_by(ein: hash["EIN"])
#   classification = Classification.find(masterfile.classification_id)
#    if classification != nil
#      if classification.description == "Organization to Prevent Cruelty to Children"
#         CSV.open("category_seeding/classification_children_cruelity_prevention.csv", 'a+') do |csv|
#           csv << [hash[:ObjectId]]
#         end
#      end
#    end
# end

