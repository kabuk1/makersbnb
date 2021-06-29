feature 'Viewing properties' do
  scenario 'A user can see the properties' do
    visit('/properties')

    expect(page).to have_content "Riverside"
    expect(page).to have_content "Lakeside"
    expect(page).to have_content "Oceanside"
  end
end
