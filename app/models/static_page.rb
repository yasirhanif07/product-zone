class StaticPage < ApplicationRecord
  include HasFriendlyId
  validates :name, presence: true, uniqueness: true
end
