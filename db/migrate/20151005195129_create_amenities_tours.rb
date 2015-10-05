class CreateAmenitiesTours < ActiveRecord::Migration
  def change
    create_table :amenities_tours do |t|
      t.references :amenity, index: true, foreign_key: true
      t.references :tour, index: true, foreign_key: true
    end
  end
end
