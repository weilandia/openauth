# frozen_string_literal: true

module RosterRowLevelSecurity
  refine ActiveRecord::Migration do
    def create_rollcall_user
      create_db_user_query = <<-SQL.squish
        CREATE USER rollcall_user;
        GRANT pg_read_all_data TO rollcall_user;
        GRANT pg_write_all_data TO rollcall_user;
      SQL

      execute(create_db_user_query)
    end

    def add_row_level_security(table_name) # rubocop:disable Metrics/MethodLength
      admin_policy = <<-SQL.squish
      CREATE POLICY admin_policy ON #{table_name} FOR ALL
      TO rollcall_user
      USING (current_setting('session.access_level', true) = 'admin')
      SQL

      execute(admin_policy)

      roster_policy = <<-SQL.squish
      CREATE POLICY roster_policy ON #{table_name} FOR ALL
      TO rollcall_user
      USING (
        current_setting('session.access_level', true) = 'roster' AND
        current_setting('session.roster_id', true) = #{table_name}.roster_id::text
      )
      SQL

      execute(roster_policy)

      execute("ALTER TABLE #{table_name} ENABLE ROW LEVEL SECURITY")
      execute("ALTER TABLE #{table_name} FORCE ROW LEVEL SECURITY")
    end

    def remove_row_level_security(table_name)
      execute("DROP POLICY admin_policy ON #{table_name}")
      execute("DROP POLICY roster_policy ON #{table_name};")
    end
  end
end
