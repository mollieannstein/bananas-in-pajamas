class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :email
      t.string  :password_digest
      t.boolean :admin_status, default: false

      t.timestamps null: false
    end
  end
end
