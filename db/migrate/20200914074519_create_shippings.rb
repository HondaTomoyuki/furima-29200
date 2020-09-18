class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :burden_id     , null: false
      t.timestamps
    end
  end
end
