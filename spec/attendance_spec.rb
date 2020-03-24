require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'user attendance' do
    before(:each) do
      @user1 = User.new(name: 'juanito', email: 'jua@nito.com')
      @user1.save
      @event1 = Event.new(description: 'juanito event', location: 'salta',
                          creator_id: @user1.id, event_date: Date.new(2001, 2, 3))
      @event1.save
    end
    it 'create valid attendance' do
      attendance1 = Attendance.new(user_id: @user1.id, event_id: @event1.id)
      expect(attendance1.valid?).to eq(true)
    end
    it 'create invalid attendance' do
      attendance1 = Attendance.new(user_id: @user1.id, event_id: 22)
      expect(attendance1.valid?).to eq(false)
    end
  end
end
