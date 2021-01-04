class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :buy
  has_one_attached :image
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days_to_delivery

  with_options presence: true do
    validates :title
    validates :explanation
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :days_to_delivery_id, numericality: { other_than: 1, message: 'Select' }
    validates :delivery_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :state_id, numericality: { other_than: 1, message: 'Slelct' }
    validates :image
    validates :price, format: { with:/\A[0-9]+\z/ }, inclusion: { in: 300..9999999}
  end


end
