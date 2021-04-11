class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.references :user, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
