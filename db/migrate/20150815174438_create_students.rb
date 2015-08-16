class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :register_number
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
