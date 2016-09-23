class Organisation < ApplicationRecord
  has_many :executives
  has_many :balances
  has_many :revenues
  has_many :expenses
end
