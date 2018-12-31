class IngredientRestriction < ApplicationRecord
  has_one :restrictable, polymorphic: true

  validates :ingredient, presence: true, uniqueness: { scope: :restrictable }
  validates :restrictable, presence: true, uniqueness: true
end
