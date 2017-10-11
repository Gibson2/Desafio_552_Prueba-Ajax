class DashboardController < ApplicationController
  def index
  	@companies = Company.group(:name_id).count
  end
end
