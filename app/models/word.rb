class Word < ApplicationRecord
    belongs_to :category
    validates :category_id, presence: true
    validates :word, presence: true
    validates :choices, presence: true
    has_many :choices, dependent: :destroy
    accepts_nested_attributes_for :choices, allow_destroy: true
end
