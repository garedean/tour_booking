class ChangeRequesterPhone < ActiveRecord::Migration
  def change
    rename_column :tours, :requester_phone, :requester_phone_number
  end
end
