feature 'Nav' do
  scenario 'nav on view properties' do
    visit('/properties')

    expect(page).to have_link('List property')
    expect(page).to have_link('My profile')
    expect(page).to have_link('Sign out')
  end
end