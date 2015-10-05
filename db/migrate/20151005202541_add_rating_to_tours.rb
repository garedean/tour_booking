class AddRatingToTours < ActiveRecord::Migration
  def change
    add_column :tours, :rating, :integer
  end
end
