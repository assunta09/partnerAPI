class Revenue < ApplicationRecord
  belongs_to :organisation
  belongs_to :contributiongrant
end
