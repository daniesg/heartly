class DishPlan < ApplicationRecord
  belongs_to :meal_plan
  has_many :tag_restictions, as: :restrictable
  has_one :calorie_restiction, as: :restrictable

  validates_presence_of :name
end
