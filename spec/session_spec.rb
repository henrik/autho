require "spec_helper"
require "autho/session"

describe Autho::Session do

  describe "#user" do
    let(:finder) { double }

    it "finds a user by ID in session" do
      controller = double(session: { my_user_id: 1 })
      user = double
      expect(finder).to receive(:find).with(1).and_return(user)

      session = Autho::Session.new(controller, :my_user_id, finder)
      expect(session.user).to eq user
    end

    it "finds nothing if there's no id in session" do
      controller = double(session: {})

      session = Autho::Session.new(controller, :my_user_id, finder)
      expect(session.user).to be_nil
    end
  end

  describe "#user=" do
    it "stores the user ID in the session" do
      controller = double(session: {})
      user = double(id: 1)

      session = Autho::Session.new(controller, :my_user_id, nil)
      session.user = user
      expect(controller.session[:my_user_id]).to eq 1
    end
  end

  describe "#clear" do
    it "clears the user ID in the session" do
      controller = double(session: {id: 1})

      session = Autho::Session.new(controller, :my_user_id, nil)
      session.clear
      expect(controller.session[:my_user_id]).to be_nil
    end
  end
end
