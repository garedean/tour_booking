class AddSpecialRequestsToTours < ActiveRecord::Migration
  def change
    add_column :tours, :special_requests, :string
  end
end
