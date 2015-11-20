class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :roll_no
      t.string :name_en
      t.string :name_my
      t.boolean :exam_status
      t.string :distinctions
      t.string :major
      t.integer :year

      t.timestamps null: false
    end
  end
end
