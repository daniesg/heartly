class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :day_plans_meal_plans
  has_many :meal_plans_dish_plans

  has_many :day_plans, through: :day_plans_meal_plans
  has_many :dish_plans, through: :meal_plans_dish_plans

  has_many :tag_restictions, as: :restrictable
  has_one :calorie_restiction, as: :restrictable, optional: true
  has_many :ingredient_restrictions, as: :restrictable

  validates :name, presence: true
end
