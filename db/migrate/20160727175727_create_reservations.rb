class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :book_id
      t.string :name
      t.date :due_on

      t.timestamps null: false
    end
  end
end
