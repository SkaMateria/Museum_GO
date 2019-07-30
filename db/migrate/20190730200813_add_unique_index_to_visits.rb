class AddUniqueIndexToVisits < ActiveRecord::Migration[5.2]
  def change
    add_index :visits, [:user_id, :museum_id], unique: true, name: "unique_visit"
  end
end
