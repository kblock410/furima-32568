class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :tel_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address
    validates :tel_number, format: { with: /\A\d{10,11}\z/ }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, tel_number: tel_number, order_id: order.id)
  end

end
