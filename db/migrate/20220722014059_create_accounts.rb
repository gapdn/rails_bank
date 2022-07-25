# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :number,   null: false
      t.monetize :credit, null: false, default: 0

      t.timestamps
    end
  end
end
