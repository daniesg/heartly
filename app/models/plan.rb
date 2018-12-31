class Plan < ApplicationRecord
  belongs_to :user
  has_many :plans_day_plans

  has_many :day_plans, through: :plans_day_plans

  has_many :tag_restictions, as: :restrictable
  has_many :ingredient_restrictions, as: :restrictable

  validates :name, presence: true
end
