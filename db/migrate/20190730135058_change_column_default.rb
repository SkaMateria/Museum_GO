class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:visits, :visited, from: nil, to: false)
  end
end
