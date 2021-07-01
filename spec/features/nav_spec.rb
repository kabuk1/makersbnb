feature 'Nav' do
  scenario 'shows nav on root page' do
    visit('/properties')

    expect(page).to have_link('View properties')
    expect(page).to have_link('List property')
    expect(page).to have_link('Login')
    expect(page).to have_link('Sign up')
  end
end