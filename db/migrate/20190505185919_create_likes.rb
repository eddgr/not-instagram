class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.belongs_to :post
      t.integer :liker_id

      t.timestamps
    end
  end
end
