class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :parent, null: true, foreign_key: { to_table: :tasks }
      t.string :label, null: false

      t.timestamps
    end
  end
end
