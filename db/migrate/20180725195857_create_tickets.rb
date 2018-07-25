class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :token
      t.string :department
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
