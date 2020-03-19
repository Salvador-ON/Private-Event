require 'spec_helper'

RSpec.describe 'index page', type: :feature do
  before(:each) do
    @user1 = User.new(name: 'juanito', email: 'jua@nito.com')
    @user1.save
    @user2 = User.new(name: 'felipe', email: 'feli@pe.com')
    @user2.save
    @event1 = Event.new(description: 'felipe party', location: 'salta',
                        user_id: @user1.id, event_date: Date.new(2001, 2, 3))
    @event1.save
    @event2 = Event.new(description: 'juanito event 2', location: 'salta',
                        user_id: @user1.id, event_date: Date.new(2021, 2, 3))
    @event2.save
    @at1 = Attendance.new(user_id: @user2.id, event_id: @event1.id)
    @at1.save
    @at2 = Attendance.new(user_id: @user2.id, event_id: @event2.id)
    @at2.save
  end
  scenario 'index page' do
    visit '/login'
    expect(page).to have_content('ID:')
  end
  scenario 'test show all previous events' do
    visit '/list_events'
    expect(page).to have_content(@event1.description)
  end
  scenario 'test show all upcomming events' do
    visit '/list_events?type=upcomming'
    expect(page).to have_content(@event2.description)
  end
  scenario 'test show one event' do
    visit "/show_event?id=#{@event1.id}"
    expect(page).to have_content("Description: #{@event1.description}")
  end
  scenario 'test show upcomming events of current user' do
    visit "/show_event?id=#{@event1.id}"
    expect(page).to have_content("Description: #{@event1.description}")
  end
  scenario 'login with user1 should show event1 description' do
    visit '/login'
    fill_in 'id', with: @user2.id
    click_button 'Submit'
    page.should have_content(@event1.description.to_s)
  end
  scenario 'login with user1 should not show event2 description' do
    visit '/login'
    fill_in 'id', with: @user2.id
    click_button 'Submit'
    page.should have_no_content(@event2.description.to_s)
  end
  scenario 'login with user1 and watch upcomming events' do
    visit '/login'
    fill_in 'id', with: @user2.id
    click_button 'Submit'
    visit '/?type=upcomming'
    page.should have_content(@event2.description.to_s)
  end
  scenario 'login with user1 and watch upcomming events, should not appear event1' do
    visit '/login'
    fill_in 'id', with: @user2.id
    click_button 'Submit'
    visit '/?type=upcomming'
    page.should have_no_content(@event1.description.to_s)
  end
  scenario 'test logout event' do
    visit '/login'
    fill_in 'id', with: @user2.id
    visit '/logout'
    page.should have_content('ID:')
  end
  scenario 'test signup event' do
    visit '/signup'
    fill_in 'name', with: 'fernando'
    fill_in 'email', with: 'fernando@fernando.com'
    click_button 'Submit'
    page.should have_content('ID:')
  end
  scenario 'test signup event' do
    visit '/signup'
    fill_in 'name', with: 'fernando'
    fill_in 'email', with: ''
    click_button 'Submit'
    page.should have_no_content('ID:')
  end
end
