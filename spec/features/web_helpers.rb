def sign_up
  fill_in('email', with: '123@gmail.com')
  fill_in('password', with: 'password')
  click_button 'Sign up'
end