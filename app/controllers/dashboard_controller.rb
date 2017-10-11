class DashboardController < ApplicationController
  def index
  	@companies = Company.all.count
  	@users = User.all.count
  	@claims = Claim.all.count
  end
end
