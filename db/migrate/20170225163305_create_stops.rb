class CreateStops < ActiveRecord::Migration[5.0]
  def change
    create_table :stops do |t|
      t.string :location

      t.timestamps
    end
  end
end
