class CreateBusTypes < ActiveRecord::Migration
  def change
    create_table :bus_types do |t|
      t.string :name, null: false, index: true, unique: true
      t.string :slug, null: false, index: true, using: :gin
      t.integer :capacity, null: false, index: true, using: :gin
      t.integer :left, null: false
      t.integer :right, null: false
      t.string :facility, array: true, null: false, default: []
      t.integer :created_by, index: true, using: :gin
      t.integer :updated_by, index: true, using: :gin
      t.timestamps null: false
    end
  end
end
