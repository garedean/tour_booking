class CreateTourTypes < ActiveRecord::Migration
  def change
    create_table :tour_types do |t|
      t.string :name
    end
  end
end
