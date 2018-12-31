class PlansDayPlan < ApplicationRecord
  belongs_to :plan
  belongs_to :day_plan

  validates :day_plan, uniqueness: { scope: :plan }
end
