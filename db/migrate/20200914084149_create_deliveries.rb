class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string     :title               , null: false
      t.text       :text                , null: false
      t.integer    :delivery_day_id     , null: false
      t.timestamps
    end
  end
end
