require 'spec_helper'


describe UserAccountValidator do


  it 'has a user details as an arguement when created' do
    user = { email: "doct@gmail.com", username: "doct", name: "Doc" }
    account_validator = UserAccountValidator.new(user)
    expect(account_validator.user_hash).to eq(user)
    expect(account_validator.user_hash[:email]).to_not be_empty
    expect(account_validator.user_hash[:name]).to_not be_empty
    expect(account_validator.user_hash[:username]).to_not be_empty
  end

  it 'raises an error if the username is and empty stirng' do
    user = {email: "doct@gmail.com", username: "", name:"Doc"}
    expect{UserAccountValidator.new(user)}.to raise_error(InvalidUserName, "Invalid user name")
  end

  it 'raises an error if the username is missing' do
    user = {email: "doct@gmail.com", name:"Doc"}
    expect{UserAccountValidator.new(user)}.to raise_error(InvalidUserName, "Invalid user name")
  end

  it 'raises an error if the email is missing' do
    user = { username: "doct", name:"Doc"}
    expect{UserAccountValidator.new(user)}.to raise_error(InvalidEmail, "Invalid email")
  end

  it 'raises an error if the email is missing the at(@) sign' do
    user = {email: "doct[at]gmail.com", username: "doct", name:"Doc"}
    expect{UserAccountValidator.new(user)}.to raise_error(InvalidEmail, "Invalid email")
  end

    describe '#username_invalid?' do

      it 'returns true if the username is nil and returns false when it is not' do
        user = {email: "doct@gmail.com", username: "doct", name:"Doc"}
        account_validator = UserAccountValidator.new(user)
        expect(account_validator.username_invalid?).to be (false)
      end

      it 'returns false if the username is not an empty string' do
        user = {email: "doct@gmail.com", username: "doct", name:"Doc"}
        account_validator = UserAccountValidator.new(user)
        expect(account_validator.username_invalid?).to be (false)
      end
    end

    describe '#email_invalid?' do

      it 'returns false if the email is not nil' do
        user = {email: "doct@gmail.com", username: "doct", name:"Doc"}
        account_validator = UserAccountValidator.new(user)
        expect(account_validator.email_invalid?).to be (false)
      end

      it 'returns false if the email has an at(@) sign' do
        user = {email: "doct@gmail.com", username: "doct", name:"Doc"}
        account_validator = UserAccountValidator.new(user)
        expect(account_validator.email_invalid?).to be (false)
      end
    end
end
