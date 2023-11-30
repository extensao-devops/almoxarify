class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto'

    create_table :categories, id: :uuid do |t|
      t.string :name, limit: 255
      t.string :description, limit: 255

      t.timestamps
    end
  end
end
