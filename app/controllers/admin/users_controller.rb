# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  def index
    render "users/index"
  end
end
