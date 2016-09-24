# Organisation.delete_all
# Revenue.delete_all
# Expense.delete_all
# Executive.delete_all
# Balance.delete_all

# org = Organisation.create(
#   name: "Devbootcamp",
#   mission: "Make beautiful and meaningful shit",
#   address: "633 Folsom St.",
#   city: "San Fran",
#   state: "California",
#   zip: 12345,
#   year_formed: 2016,
#   number_of_employees: 1337,
#   domain: "Devbootcamp.com"
#   )

# Revenue.create(
#   organisation_id: org.id,
#   year: 2016,
#   contributions: 5,
#   service_revenue: 5,
#   investments: 5,
#   other: 5,
#   total: 20)

# Expense.create(
#   organisation_id: org.id,
#   year: 2016,
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
#   year: 2016,
#   total_assets: 500,
#   total_liabilities: 400,
#   net_assets: 100
#   )


source_path = Rails.root.join('db', 'xml_files')

Dir.glob("#{source_path}/*.xml").each do |xml_file|
  puts "This is working"
end


