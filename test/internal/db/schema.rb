ActiveRecord::Schema.define(version: 1) do
  create_table :rates do |t|
    t.string :rater_type
    t.integer :rater_id
    t.string :rateable_type
    t.integer :rateable_id
    t.decimal :score, precision: 10, scale: 5, null: false
    t.string :criterion
    t.integer :weight
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
    t.index ['rateable_id', 'rateable_type', 'criterion'], name: 'index_rates_on_rateable_id_and_rateable_type_and_criterion'
    t.index ['rater_id', 'rater_type', 'criterion'], name: 'index_rates_on_rater_id_and_rater_type_and_criterion'
  end

  create_table :raters do |t|
    t.string :name
  end

  create_table :rateables do |t|
    t.string :title
  end
end
