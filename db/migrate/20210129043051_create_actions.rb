class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :content
      t.string :book_title
      t.string :book_image
      t.string :book_link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
