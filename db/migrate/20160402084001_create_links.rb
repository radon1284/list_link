class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link_name
      t.text :description
      t.string :url
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
