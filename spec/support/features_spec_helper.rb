require 'warden'

module FeaturesSpecHelper
  def warden
    request.env['warden']
  end

  def complete_sign_in_form_for(user)
    fill_in "Email", with: user.email
    fill_in "Password", with: 'password'
    click_button "Sign in"
  end
end

RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :feature
  config.include FeaturesSpecHelper, type: :feature
end

