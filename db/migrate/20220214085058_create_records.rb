class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
