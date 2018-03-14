class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.integer    :user_id, index: true, foreign_key: true
      t.attachment :attachment

      t.timestamps null: false
    end
  end
end
