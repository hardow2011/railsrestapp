class CreateRegistries < ActiveRecord::Migration[6.0]
  def change
    create_table :registries do |t|
      t.string :name
      t.string :educationLevel
      t.integer :latitude
      t.integer :longitude
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
