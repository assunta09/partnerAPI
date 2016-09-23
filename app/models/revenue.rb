class Revenue < ApplicationRecord
  belongs_to :organisation
  belongs_to :year
end
