require 'simplecov'
SimpleCov.start
require_relative "../lib/authenticator"
require_relative "../lib/user_repository"
require "json"


describe Authenticator do
  let(:user1) {
      User.new(id: 0,login: "oh",password: "qwert")
  }

  let(:users) do
    [
      user1,
      User.new(id: 1,login: "omg",password: "omg")
    ]
  end

  let(:file) do
    {
      users: users
    }.to_json
  end

  let(:user_repo) { double("UserRepository") }

  describe "#auth" do
    before do
      allow(File).to receive(:read).and_return(file)
    end
    it "returns user object" do
      expect(described_class.auth("oh", "qwert")).to be_a_kind_of(User)
    end
  end
end
