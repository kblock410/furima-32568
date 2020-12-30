class Item < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :explanation
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :days_to_delivery_id
    validates :image

    validates :price, format: { with:/\A[0-9]+\z/ }
    validates :price, inclusion: { in: 300..9999999}
  end

  belongs_to :user
  has_one :buy
  has_one_attached :image
end
