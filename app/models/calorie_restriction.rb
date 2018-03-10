class CalorieRestriction < ApplicationRecord
  has_one :restictable, polymorphic: true

  validates :tag, presence: true, uniqueness: { scope: :restictable }
end
