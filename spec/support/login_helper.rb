module LoginHelper
  def sign_in_as(user)
    visit new_user_session_path
      within('.crazy_sign_up') do
        fill_in "user_email", with: user.email
        fill_in "user_password", with: user.password
        click_button "Sign in"
    end
  end
end

