class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :slug, null: false, index: true, using: :gin
      t.string :operator_type, array: true, null: false, default: [], index: true, using: :gin
      t.text :address
      t.string :phone, array: true, null: false, default: [], using: :gin
      t.integer :created_by, index: true, using: :gin
      t.integer :updated_by, index: true, using: :gin
      t.timestamps null: false
    end

    add_index :companies, :name, unique: true
  end
end
