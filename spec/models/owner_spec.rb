require 'spec_helper'

describe Owner do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :dog_name }

  it { should allow_value('example@chris.com').for(:email) }
  it { should_not allow_value('example.com', '@example.com', 'wordword').for(:email) }
  # it { should allow_value('http://foo.com', 'http://bar.com/baz').for(:website_url) }
  # it { should_not allow_value('asdfjkl').for(:website_url) }

  # I think I want FactoryGirl here in the future
  it 'is possible to see full name of owner' do
    owner = Owner.create!(first_name: 'Benjamin', 
      last_name: 'Smith', email: 'bs@example.com', 
      dog_name: 'Ganesh')
    expect(owner.full_name).to eq('Benjamin Smith')
  end
end

