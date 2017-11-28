class AddRemovedToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :removed, :boolean, default: false
  end
end
