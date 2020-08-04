class AddSeatsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :seats, :integer, default: 1
  end
end
