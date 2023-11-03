require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    if user.standard_login?
      it {should validates_presence_of(:username)}
      it { should validate_uniqueness_of(:username)}
      it { should validate_presence_of(:password)}
    end
  end
end