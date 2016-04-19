class Articles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :creator_id
      t.string  :title
      t.boolean :featured, default: false
      t.text  :content

      t.timestamps null: false
    end
  end
end
