class CreateBankAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :bank_accounts do |t|
      t.string :account_number, null: false
      t.bigint :balance, default: 0

      t.timestamps
    end

    add_index :bank_accounts, :account_number, unique: true
  end
end
