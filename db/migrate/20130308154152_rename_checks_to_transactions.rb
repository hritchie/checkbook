class RenameChecksToTransactions < ActiveRecord::Migration
  def change
    rename_table :checks, :transactions
  end

end
