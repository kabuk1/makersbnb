feature 'Create property' do
  scenario 'A user can add a new property' do
    visit('/properties/new')
      fill_in("name", with: "Hillside")
      fill_in("description", with: "Chalet with a mountain view")
      fill_in("location", with: "Hull")
      fill_in("price", with: 60)
      fill_in("from_date", with: "2021-01-10")
      fill_in("to_date", with: "2021-10-10")
      click_button("Submit")
    
    expect(page).to have_content "Hillside"
    expect(page).to have_content "Chalet with a mountain view"
    expect(page).to have_content "Hull"
    expect(page).to have_content "60"
    expect(page).to have_content "2021-01-10"
    expect(page).to have_content "2021-10-10"
  end
end
