def sign_up
  visit('/')
  fill_in('email', with: '123@gmail.com')
  fill_in('password', with: 'password')
  click_button 'Sign up'
end

def login
  visit('/login')
  fill_in('email', with: '123@gmail.com')
  fill_in('password', with: 'password')
  click_button 'Login'
end

