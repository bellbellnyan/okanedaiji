class CreateSpendingsAndItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.timestamps
    end

    create_table :spendings do |t|
      t.integer :amount, null: false
      t.date :spent_at
      t.references :item
      t.timestamps
    end
  end
end
