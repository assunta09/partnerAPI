class Revenue < ApplicationRecord
  belongs_to :organisation
  belongs_to :contribution
end
