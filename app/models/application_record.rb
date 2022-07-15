# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.access_level=(level)
    statement = "SET ROLE rollcall_user; SET session.access_level = '#{level}'"
    connection.execute(statement)
  end

  def self.roster=(roster)
    statement = "SET ROLE rollcall_user; SET session.roster_id = '#{roster&.id}';"
    connection.execute(statement)
  end
end
