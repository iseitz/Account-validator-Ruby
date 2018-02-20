require_relative 'invalid_username'
require_relative 'invalid_email'

class UserAccountValidator

  attr_reader :name, :username, :email, :user_hash

  def initialize ( user_hash )
    @user_hash = user_hash
    @name = user_hash[:name]

    if !username_invalid?
      @username = user_hash[:username]
    else
      username_error
    end
    if !email_invalid?
      @email = user_hash[:email]
    else
      email_error
    end
  end

  def username_invalid?
    @user_hash[:username].nil? || @user_hash[:username].empty?
  end

  def username_error
      raise InvalidUserName.new('Invalid user name')
  end

  def email_invalid?
    @user_hash[:email].nil? || !@user_hash[:email].include?("@")
  end

  def email_error
      raise InvalidEmail.new('Invalid email')
  end
end
