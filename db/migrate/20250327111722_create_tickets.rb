class CreateTickets < ActiveRecord::Migration[7.2]
  def change
    create_table :tickets do |t|
      t.string :ean_code
      t.decimal :amount
      t.string :state

      t.timestamps
    end
  end
end
