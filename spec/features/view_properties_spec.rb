require 'property'

feature 'Viewing properties' do
  scenario 'A user can see the properties' do
    connection = PG.connect(dbname: 'makersbnb_test')

    Property.create(name: "Riverside", description: "Cabin with a river view", location: "River City", price: 100, from_date: '2021-01-11', to_date: '2021-10-11')
    Property.create(name: "Lakeside", description: "Cabin on the lake with a boat", location: "Lake City", price: 150, from_date: '2021-01-09', to_date: '2021-10-09')
    Property.create(name: "Oceanside", description: "Studio on the beach", location: "Ocean City", price: 200, from_date: '2021-01-08', to_date: '2021-10-08')
    
    visit('/properties')

    expect(page).to have_content "Riverside"
    expect(page).to have_content "Cabin with a river view"
    expect(page).to have_content "River City"
    expect(page).to have_content 100
    expect(page).to have_content "2021-01-11"
    expect(page).to have_content "2021-10-11"
  end
end
