class Year < ApplicationRecord
  has_many :revenues, :expenses, :balances
end
