require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user create' do
    it 'create valid user' do
      u1 = User.new(name: 'salvador', email: 'sal@sal.com')
      expect(u1.valid?).to eq(true)
    end

    it 'create invalid user' do
      u1 = User.new(name: 'salvador', email: 'salal.com')
      expect(u1.valid?).to eq(false)
    end
  end
end
