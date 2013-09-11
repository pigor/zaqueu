class Collection < ActiveRecord::Base
  belongs_to :user

  validates :description, :deadline, :email, presence: true
end
