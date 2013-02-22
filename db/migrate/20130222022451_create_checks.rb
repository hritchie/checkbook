class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :payee
      t.integer :amount

      t.timestamps
    end
  end
end
