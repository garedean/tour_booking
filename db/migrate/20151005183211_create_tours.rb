class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.references :tour_type, index: true, foreign_key: true
      t.string :requester_first_name
      t.string :requester_last_name
      t.string :requester_email
      t.string :requester_phone
      t.string :booking_date
      t.string :referrer
    end
  end
end
