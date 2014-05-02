class Collection < ActiveRecord::Base
  belongs_to :user

  validates :description, :deadline, :email, presence: true

  validate :deadline_cannot_before_today

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

  def deadline_cannot_before_today
    if deadline and deadline < Time.zone.now
      errors.add :deadline, " de cobrança devem ser após a data ou horário atual."
    end
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
