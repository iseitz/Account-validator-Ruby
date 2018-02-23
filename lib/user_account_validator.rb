require_relative 'invalid_username'
require_relative 'invalid_email'

class UserAccountValidator

  attr_reader :name, :username, :email, :user_hash
  attr_accessor :errors

  def initialize ( user_hash )
    @user_hash = user_hash
    @name = user_hash[:name]
    if !username_invalid?
      @username = user_hash[:username]
    else
      if !email_invalid?
        @email = user_hash[:email]
        username_error
      else
        email_error
        username_error
      end
    end
  end

  # in theory you can also append all the errors (InvalidEmail.new('Invalid email') and InvalidUserName.new('Invalide user name'))
  # to the array @errors = [ ] and then raise them one by one @errors.each {|error| raise error}

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
