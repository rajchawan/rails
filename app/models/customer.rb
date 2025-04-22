class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Custom validation methods
  validate :first_name_validation,
           :last_name_validation,
           :dob_cannot_be_in_the_future,
           :age_check

  NAME_PATTERN = /\A[A-Za-z]{2,}\z/
  AGE_PATTERN = /\A(100|[1-9][0-9]?|[1-9]){1}\z/

  # Validations
  validates :date_of_birth, presence: true

  private

  def dob_cannot_be_in_the_future
    unless date_of_birth.present? && date_of_birth < Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end

  def first_name_validation
    return if NAME_PATTERN.match?(first_name)

    errors.add(:first_name, 'must contain only letters and lenght should be more than 2')
  end

  def last_name_validation
    return if NAME_PATTERN.match?(last_name)

    errors.add(:last_name, 'must contain only letters and lenght should be more than 2')
  end

  def age_check
    return if AGE_PATTERN.match?(age.to_s)

    errors.add(:age, "must be between 1 to 100 or it cant't be blank!")
  end
end
