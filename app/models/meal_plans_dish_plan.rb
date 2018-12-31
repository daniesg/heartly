class MealPlansDishPlan < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :dish_plan

  validates :dish_plan, uniqueness: { scope: :meal_plan }
end
