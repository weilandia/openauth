# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_access_level
  before_action :set_roster_id

  private

  def set_access_level
    ApplicationRecord.access_level = "roster"
  end

  def set_roster_id
    ApplicationRecord.roster = current_roster.id
  end

  def current_roster
    @current_roster ||= Roster.all.sample
  end
  helper_method :current_roster
end
