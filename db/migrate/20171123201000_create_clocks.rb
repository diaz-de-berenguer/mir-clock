class CreateClocks < ActiveRecord::Migration[5.0]
  def change
    create_table :clocks do |t|
      t.boolean    :in
      t.references :employee, foreign_key: true
      t.string     :local_time

      t.timestamps
    end
  end
end
