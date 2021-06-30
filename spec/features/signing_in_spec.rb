feature "authentication" do
  scenario "a user can sign-in" do
    User.create(email: "test@example.com", password: "password123")
    visit "/"
    click_button("Login")
    fill_in("email", with: "test@example.com")
    fill_in("password", with: "password123")
    click_button("Login")
    expect(page).to have_content "Welcome, test@example.com"
  end
end
