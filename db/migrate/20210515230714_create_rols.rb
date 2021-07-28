class CreateRols < ActiveRecord::Migration[6.1]
  def up
    ['user', 'admin', 'super_admin'].each do |role_name|
      Role.create! name: role_name
    end
  end
end
