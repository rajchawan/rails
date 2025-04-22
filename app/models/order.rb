class Order < ApplicationRecord
  # after_initialize :set_default_times, if: :new_record?
  belongs_to :customer
  belongs_to :restaurant


  # Validations
  validate :schedule_time_check

  validates :quantity, :numericality => { :greater_than => 0 }


  private
  
  # def set_default_times
  #   self.opening_time ||= Time.zone.now.change(hour: 9, min: 0)
  #   self.closing_time ||= Time.zone.now.change(hour: 23, min: 0)
  # end

  def schedule_time_check
    if schedule_time < Date.today
      errors.add(:schedule_time, "can't be in the past")
    end
  end
end