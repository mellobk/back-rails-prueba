class CreateProyects < ActiveRecord::Migration[6.1]
  def change
    create_table :proyects do |t|
      t.string :name
      t.string :type_proyect
      t.string :city_name
      t.string :proyect_address
      t.float :price
      t.string :privateArea
      t.string :builtArea
      t.integer :vis_value
      t.integer :bathrooms_numbres
      t.integer :parking_lot
      t.string :sales_email

      t.timestamps
    end
  end
end
