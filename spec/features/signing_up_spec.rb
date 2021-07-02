feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')

    expect(page).to have_current_path '/users'
    expect(page).to have_content "Welcome Maker!"
  end
end