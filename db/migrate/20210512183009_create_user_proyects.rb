class CreateUserProyects < ActiveRecord::Migration[6.1]
  def change
    create_table :user_proyects do |t|


      t.timestamps
    end
  end
end
