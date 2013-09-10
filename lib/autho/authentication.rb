require "attr_extras"
require "bcrypt"

module Autho
  class Authentication
    pattr_initialize :finder, :email, :password

    def self.digest(unencrypted_password)
      BCrypt::Password.create(unencrypted_password)
    end

    def user
      user = finder.find_by_email(email)
      user && authenticate(user, password)
    end

    private

    def authenticate(user, unencrypted_password)
      if BCrypt::Password.new(user.password_digest) == unencrypted_password
        user
      else
        nil
      end
    end
  end
end
