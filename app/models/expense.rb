class Expense < ApplicationRecord
  belongs_to :organisation
  belongs_to :grant
  belongs_to :otherexpense
end
