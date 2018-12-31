class TagRestriction < ApplicationRecord
  has_one :restictable, polymorphic: true

  validates :tag, presence: true, uniqueness: { scope: :restictable }
  validates :restrictable, presence: true, uniqueness: true
end
