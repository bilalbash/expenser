module Features
  module SessionHelpers
    def sign_up_with(name, email, password, confirmation)
      visit new_user_registration_path
      fill_in 'user[name]', with: name
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', :with => confirmation
      click_button 'Register'
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'
    end
  end
end
