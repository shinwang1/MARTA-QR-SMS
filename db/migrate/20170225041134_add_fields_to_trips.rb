class AddFieldsToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :start_lat, :string
    add_column :trips, :start_long, :string
    add_column :trips, :start_location, :string
    add_column :trips, :end_lat, :string
    add_column :trips, :end_long, :string
    add_column :trips, :end_location, :string
  end
end
