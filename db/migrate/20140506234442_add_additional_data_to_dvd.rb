class AddAdditionalDataToDvd < ActiveRecord::Migration
  def change
    add_column :assets, :year, :string
    add_column :assets, :thumbnail, :string
  end
end
