class Order < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  attr_accessor :token
  validates :token, presence: true
end
