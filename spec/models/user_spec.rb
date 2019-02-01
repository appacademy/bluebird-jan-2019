require 'rails_helper'

RSpec.describe User, type: :model do

  # (1) Start by writing a validation the old way without shoulda-matchers, and then replace with a one-liner

  # let(:incomplete_user) { User.new(username: '', password: '123456') }
  # it 'validates presence of username' do
  #   expect(incomplete_user).not_to be_valid
  # end

  # (2) Change the user.rb model so that the above test fails and we can look at the error message
  # (3) Write a shoulda_matcher and have it fails so we can see new error message
  # (4) Write appropriate shoulda_matcher test

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  #these will fail
  it { should validate_uniqueness_of(:username) }
  # need to create a subject for uniquess validation 
  subject(:fred) { User.create(username: "fred", password: "123456")}
  

  it { should validate_presence_of(:session_token) }
  #this fails because if the test sets the User's session_token to nil and then runs the validations before_validation will intercept first and setup a new session_token

  describe 'session token' do
    it 'assigns a session_token if one is not given' do
      harry = User.create(username: 'harry_potter', password: 'abcdef')
      expect(harry.session_token).not_to be_nil
      
      # (5) Create a factory bot method and then use this instead.
      # expect(FactoryBot.build(:user).session_token).not_to be_nil
    end
  end

  it { should have_many(:chirps) }

  describe 'password encryption' do
    it 'does not save passwords to the database' do

      # Use if no factory bot method exists
      User.create!(username: 'harry_potter', password: 'abcdef')
      
      # Use if factory bot method exists
      # (6) First type this and see the spec fail b/c username is not harry_potter...
      # FactoryBot.create(:user)
      # (7) Then type this and see the spec pass...can overwrite attributes for factory bot
      # FactoryBot.create(:user, username: 'harry_potter')

      user = User.find_by(username: 'harry_potter')
      expect(user.password).not_to be('abcdef')
    end

    it 'encrypts the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('abcdef')

      # Use if no factory bot method exists
      User.new({ username: 'harry_potter', password: 'abcdef' })

      # (8) Use if factory bot method exists
      # FactoryBot.build(:user)
    end
  end
end