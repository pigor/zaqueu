class Collection < ActiveRecord::Base
  belongs_to :user

  validates :description, :deadline, presence: true
end
