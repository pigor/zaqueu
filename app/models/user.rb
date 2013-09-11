class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :collections

  def collections_ordered
    collections.order(:deadline)
  end
end
