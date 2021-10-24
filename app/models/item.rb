class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :title, presence: true
  validates :explanation,    presence: true
  validates :category_id,    presence: true
  validates :status_id,      presence: true
  validates :fee_id,         presence: true
  validates :region_id,      presence: true
  validates :shipped_day_id, presence: true
  validates :price  ,        presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :region
  
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 } 
  validates :fee_id, numericality: { other_than: 1 } 
  validates :region_id, numericality: { other_than: 1 } 
  validates :shipped_day_id, numericality: { other_than: 1 } 
end