class Classification < ApplicationRecord
  has_many :masterfiles
  has_many :organisations, through: :masterfile
end
