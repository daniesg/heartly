class DayPlan < ApplicationRecord
  belongs_to :user
  has_many :plans_day_plans
  has_many :day_plans_meal_plans
  
  has_many :plans, through: :plans_day_plans
  has_many :meal_plans, through: :day_plans_meal_plans

  has_many :tag_restictions, as: :restrictable
  has_one :calorie_restiction, as: :restrictable, optional: true
  has_many :ingredient_restrictions, as: :restrictable

  validates :name, presence: true
end
