class AddCategoryToMicroposts < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.string :description

      t.timestamps
    add_column :microposts, :category, :string
  end
end
  def self.down
    drop_table :microposts, :category
  end
end

