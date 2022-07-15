class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    enable_extension("citext")

    create_table :organizations do |t|
      t.citext "name", null: false, index: { unique: true }
      t.timestamps
    end
  end
end
