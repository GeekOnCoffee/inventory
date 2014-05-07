class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :description
      t.references :location, index: true

      t.timestamps
    end
  end
end
