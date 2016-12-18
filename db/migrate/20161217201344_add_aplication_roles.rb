class AddAplicationRoles < ActiveRecord::Migration[5.0]
  def up
    ['normal','admin', 'student', 'donor','parent','child','keyDonor'].each do |role_name|
      Role.create! name: role_name
    end
  end
  def down
    Role.where(name: ['normal','admin', 'student', 'donor','parent','child','keyDonor']).destroy_all
  end
end
