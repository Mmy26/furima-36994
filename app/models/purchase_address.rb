class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :region_id, :city, :street, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :zip_code
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :zip_code,     format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :phone_number, numericality: { with: /\A[0-9]\z/, message: 'is invalid. Input only number' }
  validates :phone_number, format: { with: /\A[!-~,ぁ-ん]{10,11}\z/, message: 'is too short' }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, region_id: region_id, city: city, street: street, building: building,
                   phone_number: phone_number, purchase_id: purchase.id)
  end
end
