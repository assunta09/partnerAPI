FactoryGirl.define do
  factory :organisation do
    name "NGO"}
    mission "Lorem Ipsum"
    address  "Street Name"
    year_formed 2014
    number_of_employees 12
    domain Faker::Internet.domain
    ein '201423445'
    masterfile_id 2
  end
end
