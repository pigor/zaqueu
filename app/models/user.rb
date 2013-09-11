class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :collections

  validates :name, :email, :password, presence: true

  def collections_ordered
    collections.order(:deadline)
  end
end
