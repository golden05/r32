class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :nsh
      t.string :address

      t.timestamps
    end
  end
end
