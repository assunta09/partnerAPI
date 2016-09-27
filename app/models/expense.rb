class Expense < ApplicationRecord
  belongs_to :organisation
  belongs_to :grant
  belongs_to :other_expense
  belongs_to :salary
end
