require 'simplecov'
SimpleCov.start
require_relative "../lib/user"
require_relative "../lib/user_helper"
require_relative "../lib/user_repository"
require "json"


describe UserHelper do
  describe "#get_id" do
    let(:repo) {double("UserRepository")}
    let(:array) {double("Array")}
    let(:user) {double("User")}
    before do
      allow(UserRepository).to receive(:new).and_return(repo)
      allow(repo).to receive(:all).and_return(array)
      allow(array).to receive(:last).and_return(user)
      allow(user).to receive(:id).and_return(0)
    end
    it "returns id" do
      expect(described_class.get_id).to eq(1)
    end
  end
end
