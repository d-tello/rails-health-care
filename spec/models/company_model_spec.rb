require 'rails_helper'

RSpec.describe 'Company', type: :model do
  let(:valid_attributes) do
    {
      name: 'Dr. House'
    }
  end

  it 'has a name' do
    company = Company.new(name: 'Dr. House')
    expect(company.name).to eq('Dr. House')
  end

  it 'name cannot be blank' do
    attributes = valid_attributes
    attributes.delete(:name)
    company = Company.new(attributes)
    expect(company).not_to be_valid
  end

  it 'name is unique' do
    Company.create!(name: 'Dr. House')
    company = Company.new(name: 'Dr. House')
    expect(company).not_to be_valid
  end
end
