require "rails_helper"

RSpec.describe User, type: :model do
  # describe 'Validations' do
  #   # validation tests/examples here
  #   before(:each) do
  #     @user = User.new(email: "test@test.com", username: "Tester", password: "a1b2c3", password_confirmation: "a1b2c3")
  #   end

  #   context "all fields filled then valid" do
  #     it "is valid with all fields are filled" do
  #       expect(@user).to be_valid
  #     end
  #   end

  #   context "username must be presence" do
  #     it "is not valid if username is nil" do
  #       @user.username = nil
  #       expect(@user).to_not be_valid
  #     end
  #   end

  #   context "email must be presence" do
  #     it "is not valid if username is nil" do
  #       @user.email = nil
  #       expect(@user).to_not be_valid
  #       expect(@user.errors.full_messages).to include("Email can't be blank")
  #     end
  #   end

  #   context "password and password_confirmation must be equal" do
  #     it "is not valid if password and the confirmation are not equal" do
  #       @user.password = '123'
  #       expect(@user).to_not be_valid
  #     end
  #     it "is valid if password and the confirmation are equal" do
  #       @user.password = "1d2d3d"
  #       @user.password_confirmation = "1d2d3d"
  #       expect(@user).to be_valid
  #     end
  #   end

  #   context "password must be longer than 5 digits" do
  #     it "is not valid if password is shorter than 5 digits" do
  #       @user.password = "123"
  #       @user.password_confirmation = "123"
  #       expect(@user).to_not be_valid
  #     end
  #   end

  #   context "email must be uniq" do
  #     it "is not valid if email to lowercase is already in database" do
  #       @user2 = User.new(email: "TEST@test.com", username: "Mike", password: "a1b2c3", password_confirmation: "a1b2c3")
  #       @user.save
  #       @user2.save
  #       expect(@user).to be_valid
  #       # puts @user2
  #       expect(@user2).to_not be_valid
  #     end
  #   end
  # end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before(:each) do
      @user = User.new(email: "test@test.com", username: "Tester", password: "a1b2c3", password_confirmation: "a1b2c3")
      @user2 = User.new(email: "test2@test.com", username: "Mike", password: "a1b2c3", password_confirmation: "a1b2c3")
    end
    context "valid email and password can login" do
      it "is valid if email and password are valid" do
        @user.save
        validateUser = User.authenticate_with_credentials(@user.email, @user.password)
        expect(validateUser).to eq(@user)
      end
    end
  
    context "email starting or ending with empty space also valid" do
      it "is valid if email and password are valid" do
        @user.save
        validateUser = User.authenticate_with_credentials(" " + @user.email + " ", @user.password)
        expect(validateUser).to eq(@user)

        @user2.save
        validateUser2 = User.authenticate_with_credentials("    " + @user2.email + "  ", @user2.password)
        expect(validateUser2).to eq(@user2)
      end
    end

    context "mixed email case is valid if lowercased email is in database" do
      it "is valid if email is UPPERCASE" do
        @user.save
        validateUser = User.authenticate_with_credentials("TEST@TEST.Com", @user.password)
        expect(validateUser).to eq(@user)

        @user2.save
        validateUser2 = User.authenticate_with_credentials("teST2@tesT.cOm", @user2.password)
        expect(validateUser2).to eq(@user2)
      end
    end
  end

end