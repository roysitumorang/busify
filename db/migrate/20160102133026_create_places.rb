class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :region_id, index: true, using: :gin
      t.string :name, null: false, index: true, unique: true
      t.string :type, null: false, index: true, using: :gin
      t.string :slug, null: false, index: true, using: :gin
      t.integer :created_by, index: true, using: :gin
      t.integer :updated_by, index: true, using: :gin
      t.timestamps null: false
    end
  end
end
