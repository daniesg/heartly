class MealPlan < ApplicationRecord
  belongs_to :day_plan
  has_many :dish_plans
  has_many :tag_restictions, as: :restrictable
  has_one :calorie_restiction, as: :restrictable

  validates :name, presence: true
  validates_presence_of :day_plan_id
end
