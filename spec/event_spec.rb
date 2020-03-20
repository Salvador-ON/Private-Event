require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user create' do
    it 'create valid event' do
      user1 = User.new(name: 'juanito', email: 'jua@nito.com')
      user1.save
      event1 = Event.new(description: 'juanito event', location: 'salta',
                         creator_id: user1.id, event_date: Date.new(2001, 2, 3))
      expect(event1.valid?).to eq(true)
    end
    it 'create invalid event' do
      user1 = User.new(name: 'juanito', email: 'jua@nito.com')
      user1.save
      event1 = Event.new(description: 'juanito event', location: 'salta', creator: user1.id, event_date: nil)
      expect(event1.valid?).to eq(false)
    end
  end
end
