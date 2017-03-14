class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :amount
      t.float :price
      t.string :eastsun_id

      t.timestamps
    end
  end
end
