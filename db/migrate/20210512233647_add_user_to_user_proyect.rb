class AddUserToUserProyect < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_proyects, :user, foreign_key: true
  end
end
