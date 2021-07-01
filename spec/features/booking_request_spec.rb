

feature 'Booking request' do
    scenario 'user can fill request form' do
        visit('/request')
        fill_in("checkin", with: "2021-01-10")
        fill_in("checkout", with: "2021-10-10")
        select '3', from: 'guests'
        click_button 'Request for booking'
    end
end