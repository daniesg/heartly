class DayPlan < ApplicationRecord
  has_many :meal_plans
  has_many :tag_restictions, as: :restrictable
  has_one :calorie_restiction, as: :restrictable

  validates :name, presence: true
end
