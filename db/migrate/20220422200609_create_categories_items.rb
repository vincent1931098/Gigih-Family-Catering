class CreateCategoriesItems < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_items, id: false do |t|
      t.belongs_to :category
      t.belongs_to :item
      t.timestamps
    end
  end
end
