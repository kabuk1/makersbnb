feature 'Create property' do
  scenario 'A user can add a new property' do
    visit('/properties/new')
      fill_in("name", with: "Hillside")
      fill_in("description", with: "Chalet with a mountain view")
      fill_in("location", with: "Hull")
      fill_in("price", with: 60)
      click_button("submit")
    expect(page).to have_content "Hillside"
  end
end
