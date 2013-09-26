class Collection < ActiveRecord::Base
  belongs_to :user

  validates :description, :deadline, :email, presence: true

  scope :by_deadline, ->(datetime) { where(deadline: datetime.strftime("%Y-%m-%d %H:%M")) }

  def notify
    Notification.notify(self).deliver

    self.update_attributes(send_count: (self.send_count + 1))
  end
end
