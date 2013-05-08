class CreateWordsets < ActiveRecord::Migration
  def change
    create_table :wordsets do |t|
      t.string :name
      t.string :description
      t.integer :priority

      t.timestamps
    end
  end
end
