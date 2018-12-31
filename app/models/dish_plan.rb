class DishPlan < ApplicationRecord
  belongs_to :user
  has_many :meal_plans_dish_plans

  has_many :meal_plans, through: :meal_plans_dish_plans

  has_many :tag_restictions, as: :restrictable
  has_one :calorie_restiction, as: :restrictable
  has_many :ingredient_restrictions, as: :restrictable

  validates_presence_of :name
end
