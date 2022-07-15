# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  private

  def set_access_level
    ApplicationRecord.access_level = "admin"
  end

  def set_tenant_id
    ApplicationRecord.tenant = nil
  end
end
