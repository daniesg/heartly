class Plan < ApplicationRecord
  has_many :day_plans
  has_many :tag_restictions, as: :restrictable

  validates :name, presence: true
end
