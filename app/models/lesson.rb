class Lesson < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :level

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :zoom_url
    validates :zoom_password
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end

  validates :level_id, numericality: { other_than: 1, message: 'Select' }
  validates_inclusion_of :price, in: 500..50_000, message: 'Out of setting range'
end
