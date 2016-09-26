class Masterfile < ApplicationRecord
  belongs_to :classification
  has_many :organisations
end
