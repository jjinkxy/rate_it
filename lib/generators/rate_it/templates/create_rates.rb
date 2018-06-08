class RateItCreateRates < ActiveRecord::Migration[4.2]
  def change
    create_table :rates do |t|
      t.belongs_to :rater, polymorphic: true
      t.belongs_to :rateable, polymorphic: true
      t.decimal :score, precision: 10, scale: 5, null: false
      t.string :criterion, default: nil
      t.integer :weight, null: false

      t.timestamps null: false
    end

    add_index :rates, %i[rater_id rater_type criterion]
    add_index :rates, %i[rateable_id rateable_type criterion]
  end
end
