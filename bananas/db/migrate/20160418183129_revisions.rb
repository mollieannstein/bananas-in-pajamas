class Revisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.integer :revisor_id
      t.integer  :article_id
      t.text :revised_content

      t.timestamps null: false
    end
  end
end
