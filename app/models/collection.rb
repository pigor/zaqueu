class Collection < ActiveRecord::Base
  belongs_to :user

  validates :description, :deadline, :email, presence: true

  scope :by_deadline, ->(datetime) {
    where('deadline > ? and deadline <= ?', (datetime - 10.minutes), datetime)
  }

  def notify(options={})
    Notification.notify(self).deliver
    
    updates = { send_count: (self.send_count + 1) }
    updates[:deadline] = next_deadline unless options[:manual]

    self.update_attributes(updates)
  end

  def next_deadline
    return deadline unless repetition

    deadline + self.send(repetition.to_sym)
  end

  private

  def every_day
    1.day
  end

  def every_week
    1.week
  end

  def every_month
    1.month
  end

  def every_year
    1.year
  end
end
