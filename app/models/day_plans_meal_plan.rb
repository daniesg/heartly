class DayPlansMealPlan < ApplicationRecord
  belongs_to :day_plan
  belongs_to :meal_plan

  validates :meal_plan, uniqueness: { scope: :day_plan}
end
