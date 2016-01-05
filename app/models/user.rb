class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :collections

  validates :name, :email, :password, presence: true

  def collections_ordered
    collections.order(:deadline)
  end

  def api_params
    {
      username: username,
      name: name,
      email: email,
      collections: collections_ordered
    }
  end
end
