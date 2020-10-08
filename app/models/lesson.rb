class Lesson < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :content
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end

  validates_inclusion_of :price, in: 500..50_000, message: 'Out of setting range'
end
