require 'property'

feature 'booking request' do
  scenario 'user can make a booking request' do
    connection = PG.connect(dbname: 'makersbnb_test')

    Property.create(name: "Riverside", description: "Cabin with a river view", location: "River City", price: 100, from_date: '2021-01-11', to_date: '2021-10-11')

    visit('/')
    sign_up
    login
    click_link('View properties')
    
    expect(page).to have_content "Riverside"
    expect(page).to have_content "Cabin with a river view"
    expect(page).to have_content "River City"
    expect(page).to have_content 100
    expect(page).to have_content "2021-01-11"
    expect(page).to have_content "2021-10-11"
  end
end


#     visit()
#     Property.create(name: "Riverside", description: "Cabin with a river view", location: "River City", price: 100, from_date: '2021-01-11', to_date: '2021-10-11')

#     visit '/sessions/booking'
#     fill_in("email", with: "matt@example.com")
#     fill_in("password", with: "Matty123")
#     click_button("Login")
#     click_button("")
#   end
# end