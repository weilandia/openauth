# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_access_level
  before_action :set_roster

  private

  def set_access_level
    ApplicationRecord.access_level = params[:access_level] || "roster"
  end

  def set_roster
    ApplicationRecord.roster = params[:access_level].nil? ? current_roster : nil
  end

  def current_roster
    @current_roster ||= Roster.all.sample
  end
  helper_method :current_roster
end
