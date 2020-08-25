class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.text :base64Picture
      t.references :registry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
