class RemovePerishableTokenFromUsers < ActiveRecord::Migration[5.1]

    def up
      remove_column :users, :perishable_token, :string
    end
    def down
      add_column :uesrs, :perishable_token, :string
    end

end
