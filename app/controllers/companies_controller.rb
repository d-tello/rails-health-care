class CompaniesController < ApplicationController
  def index
    @company = Company.first
  end

  private

  def service_params
    params.require(:service).permit(
      name,
      schedules_attributes: %i[
        id
        opens_at
        closes_at
        weekday
        _destroy
      ]
    )
  end
end
