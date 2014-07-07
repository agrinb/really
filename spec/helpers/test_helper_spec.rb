require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TestHelper. For example:
#
# describe TestHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TestHelper, :type => :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end

def sign_in_as(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

