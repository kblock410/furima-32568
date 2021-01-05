class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title              , null: false
      t.text       :text               , null: false
      t.integer    :category_id        , null: false
      t.integer    :state_id           , null: false
      t.integer    :delivery_fee_id    , null: false
      t.integer    :prefecture_id      , null: false
      t.integer    :days_to_delivery_id, null: false
      t.timestamps
    end
  end
end
