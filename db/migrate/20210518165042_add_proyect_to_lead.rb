class AddProyectToLead < ActiveRecord::Migration[6.1]
  def change
    add_reference :leads, :proyect, null: false, foreign_key: true
  end
end
