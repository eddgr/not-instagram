class CreateMessageThreads < ActiveRecord::Migration[5.2]
  def change
    create_table :message_threads do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :receiver_id
      t.text :body

      t.timestamps
    end
  end
end
