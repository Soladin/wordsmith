class AddDetailsToWordset < ActiveRecord::Migration
  def change
    add_column :wordsets, :url, :string
  end
end
