class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :password_digest
     # t.integer :permission

      t.timestamps
    end
  end
end
