class CreateAccountTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :account_transactions do |t|
      t.belongs_to :sender_account, class_name: 'Account',
                   null: false, index: true, foreign_key: { to_table: :accounts }
      t.belongs_to :receiver_account, class_name: 'Account',
                   null: false, index: true, foreign_key: { to_table: :accounts }
      t.integer    :sender_account_balance, null: false
      t.integer    :receiver_account_balance, null: false
      t.integer    :amount, null: false

      t.timestamps
    end
  end
end
