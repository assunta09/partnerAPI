class Organisation < ApplicationRecord
  has_many :executives, :balances, :revenues, :expenses
end
