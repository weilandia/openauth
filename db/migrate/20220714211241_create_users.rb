class CreateUsers < ActiveRecord::Migration[7.0]
  using RosterRowLevelSecurity

  def up
    create_table :users do |t|
      t.citext :email
      t.citext :phone_number
      t.citext :first_name
      t.citext :middle_name
      t.citext :last_name
      t.boolean :pending, default: false

      t.references :roster, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end

    add_index :users, %i[email roster_id], unique: true, name: "unique_emails_on_roster"
    add_index :users, %i[phone_number roster_id], unique: true, name: "unique_phone_numbers_on_roster"

    add_row_level_security("users")
  end

  def down
    remove_row_level_security("users")

    drop_table :users
  end
end
