# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#

require 'spec_helper'

#def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
#  user = User.where(:provider => auth.provider, :uid => auth.uid).first
#  unless user
#    user = User.create(name: auth.extra.raw_info.name,
#                       provider: auth.provider,
#                       uid: auth.uid,
#                       email: auth.info.email,
#                       password: Devise.friendly_token[0, 20]
#    )
#  end
#  user
#
describe User do
  let(:user) { FactoryGirl.create(:user, :confirmed) }
  let(:valid_fb) {
    OmniAuth.config.add_mock(:facebook, {:uid => 'fb-uuid', info: {email: 'user@gg.com'}, extra: {raw_info: {name: 'raw_name'}}})
    OmniAuth.config.mock_auth[:facebook] }

  let(:valid_fb_present) {
    OmniAuth.config.add_mock(:facebook, {:uid => 'fb-uuid', info: {email: user.email}, extra: {raw_info: {name: 'raw_name'}}})
    OmniAuth.config.mock_auth[:facebook] }

  before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  describe "#find_for_facebook_oauth" do
    it "should create new user with FB" do
      expect {
        User.find_for_facebook_oauth(valid_fb)
      }.to change {
        User.count
      }.by(1)
    end
  end

  context "Existed user" do
    describe "with this email" do
      before do
        user
      end

      it "should not create new User record" do
        expect {
          User.find_for_facebook_oauth(valid_fb_present)
        }.to change {
          User.count
        }.by(0)
      end

      it "should and return User object" do
        User.find_for_facebook_oauth(valid_fb_present).should be_kind_of(User)
      end
    end
  end

end

