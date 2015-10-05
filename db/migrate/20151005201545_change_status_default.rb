class ChangeStatusDefault < ActiveRecord::Migration
  def change
    change_column_default :tours, :status, ""
  end
end
