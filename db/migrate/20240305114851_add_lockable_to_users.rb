class AddLockableToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :failed_attempts, :integer
    add_index :users, :failed_attempts
    add_column :users, :locked_at, :datetime
    add_column :users, :unlock_token, :string
    add_index :users, :unlock_token
  end
end
