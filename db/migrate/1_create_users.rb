class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :id
      t.string :nombreUsuario
      t.string :password
      t.boolean :admin

      t.timestamps
    end
  end
end
