class Restaurant < ApplicationRecord
# A restaurant must have a name, an address and a category.
# A restaurant’s category must belong to this fixed list: ["chinese", "italian", "japanese", "french", "belgian"].
# When a restaurant is destroyed, all of its reviews must be destroyed as well.

  CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  has_many :reviews, dependent: :destroy
end
