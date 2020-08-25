class Registry < ApplicationRecord
  belongs_to :users
  has_one :picture
end
