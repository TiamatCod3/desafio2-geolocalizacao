class AddDistanceToBikePoint < ActiveRecord::Migration[7.0]
  def change
    add_column :bike_points, :distance, :float
  end
end
