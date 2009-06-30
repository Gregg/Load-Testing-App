class InitialMigration < ActiveRecord::Migration
  def self.up
    # Create admin role
    admin_role = Role.create(:name => 'admin')
    
    # Create default admin user
    user = User.create do |u|
      u.login = 'admin'
      u.password = u.password_confirmation = 'asdfasdf'
      u.email = 'Gregg@RailsEnvy.com'
      u.activated_at = '20090630144147'
    end
      
    # Add admin role to admin user
    user.roles << admin_role
  end

  def self.down
    
  end
end
