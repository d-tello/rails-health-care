class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  private

  def company_params
    params.require(:company).permit(
      name,
      schedules_attributes: %i[
        id
        opens_at
        closes_at
        weekday
        _destroy
        closed
      ]
    )
  end
end
