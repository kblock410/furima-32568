class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days_to_delivery

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :explanation
    validates :image
    validates :price, format: { with:/\A[0-9]+\z/ }, inclusion: { in: 300..9999999}

    with_options numericality: { other_than: 0, message: 'Select' } do
      validates :category_id
      validates :days_to_delivery_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :state_id
    end
  end
end
