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
    context "with correct credentials" do
      before do
        require pry;     binding.pry
        allow(File).to receive(:read).and_return(file)
        allow(user_repo).to receive(:all).and_return(users)
      end
      it "returns user object"
        expect(described_class.auth("login", "password")).to be_a_kind_of(User)
    end
  end
end
