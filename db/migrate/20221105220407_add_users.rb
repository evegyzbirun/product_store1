class AddUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.column :admin, :boolean
      
      t.timestamps
    end
  end
end