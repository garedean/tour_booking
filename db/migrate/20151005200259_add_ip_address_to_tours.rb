class AddIpAddressToTours < ActiveRecord::Migration
  def change
    add_column :tours, :ip_address, :string
  end
end
