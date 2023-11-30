class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items, id: :uuid do |t|
      t.string :name, limit: 255
      t.string :description, limit: 255
      t.references :category, null: false, type: :uuid, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
