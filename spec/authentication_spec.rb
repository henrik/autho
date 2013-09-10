require "spec_helper"
require "autho/authentication"

describe Autho::Authentication do
  describe "#user" do
    let(:finder) { double }
    let(:user) { double(password_digest: digest("sesame")) }

    it "returns the user with matching email and password" do
      expect(finder).to receive(:find_by_email).with("user@example.com").and_return(user)

      auth = Autho::Authentication.new(finder, "user@example.com", "sesame")
      expect(auth.user).to eq user
    end

    it "finds nothing if email does not match" do
      expect(finder).to receive(:find_by_email).with("user@example.com").and_return(nil)

      auth = Autho::Authentication.new(finder, "user@example.com", "sesame")
      expect(auth.user).to be_nil
    end

    it "finds nothing if password does not match" do
      expect(finder).to receive(:find_by_email).with("user@example.com").and_return(user)

      auth = Autho::Authentication.new(finder, "user@example.com", "nomagic")
      expect(auth.user).to be_nil
    end
  end

  def digest(unencrypted_password)
    BCrypt::Password.create(unencrypted_password)
  end
end
