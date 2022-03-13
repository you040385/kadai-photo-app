class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
