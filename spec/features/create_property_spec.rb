feature 'Create property' do
  scenario 'A user can add a new property' do
    visit('/properties/new')
      fill_in("name", with: "Hillside")
      click_button("submit")
    expect(page).to have_content "Hillside"
  end
end
