class CreateRosters < ActiveRecord::Migration[7.0]
  def change
    create_table :rosters do |t|
      t.citext "name", null: false
      t.references :organization, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
    end

    add_index :rosters, [:name, :organization_id], unique: true, name: "unique_roster_names_on_organization"
  end
end
