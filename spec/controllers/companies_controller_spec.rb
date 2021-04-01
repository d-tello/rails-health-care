require 'rails_helper'
begin
  require 'companies_controller'
rescue LoadError
end

if defined?(CompaniesController)
  RSpec.describe CompaniesController, type: :controller do
    let(:valid_attributes) do
      {
        name: 'Dr. House'
      }
    end

    let(:invalid_attributes) do
      { name: '' }
    end

    describe 'index action' do
      before do
        get :index
      end

      it 'returns a succesfull response' do
        expect(response).to have_http_status(200)
      end

      it 'renders the index page' do
        expect(response).to render_template :index
      end

      it 'assigns all companies as @companies' do
        company = Company.create! valid_attributes
        get :index, params: {}
        expect(assigns(:companies)).to eq([company])
      end
    end

    describe 'create action' do
      describe 'with valid params' do
        it 'creates a new Company' do
          expect do
            post :create, params: { company: valid_attributes }
          end.to change(Company, :count).by(1)
        end

        it 'assigns a newly created company as @company' do
          post :create, params: { company: valid_attributes }
          expect(assigns(:company)).to be_a(Company)
          expect(assigns(:company)).to be_persisted
        end

        it 'redirects to the index page' do
          post :create, params: { company: valid_attributes }
          expect(response).to redirect_to('/')
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved company as @company' do
          post :create, params: { company: invalid_attributes }
          expect(assigns(:company)).to be_a_new(Company)
        end

        it 'renders the page again with error if the params are not valid' do
          post :create, params: { company: invalid_attributes }
          expect(response).to render_template('new')
        end
      end
    end
  end
else
  describe 'CompaniesController' do
    it 'should exist' do
      expect(defined?(CompaniesController)).to eq(true)
    end
  end
end
