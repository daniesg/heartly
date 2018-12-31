class CalorieRestriction < ApplicationRecord
  has_one :restictable, polymorphic: true

  validates :restrictable, presence: true, uniqueness: true
  validates :min_calories, numericality: { only_integer: true, greater_than_or_equal_to: 1, allow_nil: true }
  validates :max_calories, numericality: { only_integer: true, greater_than_or_equal_to: 1, allow_nil: true }

  validate :min_less_than_max

  private

  def min_less_than_max
    return unless min_calories.present? && max_calories.present?
    if min_calories > max_calories
      errors[:base] << "The maximum amount of calories cannot be less than the minimum amount of calories"
    end
  end
end
