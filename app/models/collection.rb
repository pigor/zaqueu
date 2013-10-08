class Collection < ActiveRecord::Base
  belongs_to :user

  validates :description, :deadline, :email, presence: true

  scope :by_deadline, ->(datetime) {
    where('deadline > ? and deadline <= ?', (datetime - 10.minutes), datetime)
  }

  def notify
    Notification.notify(self).deliver

    self.update_attributes(send_count: (self.send_count + 1))
  end
end
