#Started POST "/users/sign_in?locale=ru" for 127.0.0.1 at 2013-11-11 13:50:51 +0200
#Processing by Devise::SessionsController#create as HTML
#Parameters: {"utf8"=>"✓", "authenticity_token"=>"xdMP2/958K/Di6Z7VrE0V4x7/rnYF08ZgTm+0GQBRHM=", "user"=>{"email"=>"test4@gg.com", "password"=>"[FILTERED]", "remember_me"=>"0"}, "commit"=>"Войти", "locale"=>"ru"}
#User Load (0.4ms)  SELECT `users`.* FROM `users` WHERE `users`.`email` = 'test4@gg.com' LIMIT 1
#   (0.4ms)  BEGIN
#   (0.3ms)  UPDATE `users` SET `current_sign_in_at` = '2013-11-11 11:50:52', `sign_in_count` = 2, `updated_at` = '2013-11-11 11:50:52' WHERE `users`.`id` = 7
#   (1.5ms)  COMMIT

require 'spec_helper'

describe Devise::SessionsController do
  let(:user) { FactoryGirl.create(:user, :confirmed) }
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it "should signin user" do

    expect {
      post :create, user: {email: user.email, password: "123456abc!ABC"}
    }.to change {
      user.reload
      user.sign_in_count
    }.by(1)
  end

  it "should not signin user with wrong password" do
    expect {
      post :create, user: {email: user.email, password: "password"}
    }.to_not change { user.sign_in_count }.by(1)
    response.should render_template('devise/sessions/new')
  end

end
