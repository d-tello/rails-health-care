require 'rails_helper'

begin
  require 'companies_controller'
rescue LoadError
end

if defined?(CompaniesController)

  RSpec.describe CompaniesController, type: :routing do
    describe 'routing' do
      it 'routes to #index' do
        expect(get: '/').to route_to('companies#index')
      end

      it 'routes to #new' do
        expect(get: '/companies/new').to route_to('companies#new')
      end

      it 'routes to #create' do
        expect(post: '/companies').to route_to('companies#create')
      end
    end
  end
end
