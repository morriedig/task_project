class AddCookiesTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cookies_token, :string
  end
end
