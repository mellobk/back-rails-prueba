class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
