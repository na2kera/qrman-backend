class CreateWebsites < ActiveRecord::Migration[8.0]
  def change
    create_table :websites do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
