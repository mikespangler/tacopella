class UpdateUserTable < ActiveRecord::Migration
  def change
    add_column :users, :uid,              :string
    add_column :users, :provider,         :string 
    add_column :users, :name,             :string
    add_column :users, :oauth_token,      :string
    add_column :users, :oauth_expires_at, :datetime
    add_column :users, :created_at,       :datetime
    add_column :users, :updated_at,       :datetime
    add_column :users, :email,            :string
    add_column :users, :username,         :string
    add_column :users, :password_digest,  :string
  end
end
