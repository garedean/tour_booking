class AddStatusToTours < ActiveRecord::Migration
  def change
    add_column :tours, :status, :string
  end
end
