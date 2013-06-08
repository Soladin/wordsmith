class AddWordsetIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :wordset_id, :integer
  end
end
