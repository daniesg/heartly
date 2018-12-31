class DishRestriction < ApplicationRecord
  has_one :meal_plan

  validates :meal_plan_id, presence: true, uniqueness: true
  validates :min_dishes, numericality: { only_integer: true, greater_than_or_equal_to: 1, allow_nil: true }
  validates :max_dishes, numericality: { only_integer: true, greater_than_or_equal_to: 1, allow_nil: true }

  validate :min_less_than_max

  private

  def min_less_than_max
    return unless min_dishes.present? && max_dishes.present?
    if min_dishes > max_dishes
      errors[:base] << "The maximum amount of dishes cannot be less than the minimum amount of dishes"
    end
  end
end
