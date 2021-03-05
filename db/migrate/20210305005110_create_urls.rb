class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :address, null: false
      t.string :shortened_address, null: true
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
