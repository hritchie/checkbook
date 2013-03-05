class AddAccountIdToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :account_id, :integer
  end
end
