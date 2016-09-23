class Year < ApplicationRecord
  has_many :revenues
  has_many :expenses
  has_many :balances
end
