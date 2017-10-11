class ClaimsController < ApplicationController

  before_action :set_claim, only: [:destroy]

  def create
    @company = Company.find(params[:company_id])

    @claims = @company.claims

    @claim = @company.claims.build(claim_params)
    @claim.user = current_user
    respond_to do |format|
      if @claim.save
        format.html { redirect_to @company, notice: 'Claim was successfully created.' }
        format.json { render :show, status: :created, location: @company }
        format.js
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_claim
    @claim = Claim.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def claim_params
    params.require(:claim).permit(:content, :company_id)
  end
end