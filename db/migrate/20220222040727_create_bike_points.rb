class CreateBikePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :bike_points do |t|
      t.string :district
      t.string :station
      t.integer :code
      t.string :address
      t.string :number
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
