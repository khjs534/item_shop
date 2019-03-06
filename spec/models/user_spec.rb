require 'rails_helper'

Rspec.describe User type: :model do
  let!(:user) { create(:user,
                      email: 'test@test.com',
                      password: 'testpassword')}

  describe 'Attributes' do
    it 'validates email' do
      user.email = ''
      expect(user.valid?).to eq(false)
    end

    it 'validates password' do
      user.password = nil
      expect(user.valid?).to eq(false)
    end
  end
end