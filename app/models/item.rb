class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  VALID_PRICEL_REGEX = /\A[0-9]+\z/

  validates :title,          presence: true
  validates :explanation,    presence: true
  validates :category_id,    presence: true
  validates :status_id,      presence: true
  validates :fee_id,         presence: true
  validates :region_id,      presence: true
  validates :shipped_day_id, presence: true
  validates :price,          presence: true
  validates :price,          numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is Out of setting range' }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :region
  belongs_to :shipped_day

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipped_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
