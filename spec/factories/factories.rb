FactoryGirl.define do
  factory :organisation do
    id 1
    name Faker::Company.name
    mission Faker::Company.catch_phrase
    address "2230 Rio Grande St. Austin TX 78305"
    year_formed 2016
    number_of_employees 100
    domain Faker::Internet.domain_name
    ein Faker::Company.ein
    masterfile_id 1
  end
end

FactoryGirl.define do
  factory :program_service_accomplishment do
    organisation_id 1
    expense_amount rand(999999)
    grant_amount rand(999999)
    revenues rand(999999)
    description Faker::Lorem.sentence
    year 2016
  end
end

FactoryGirl.define do
  factory :revenue do
    organisation_id 1
    year 2016
    contribution_id 1
    service_revenue rand(999999)
    investments rand(999999)
    other rand(999999)
  end
end

FactoryGirl.define do
  factory :grant do
    domestic_organisations rand(999999)
    domestic_individuals rand(999999)
    foreign_entities rand(999999)
    total rand(99999)
  end
end
