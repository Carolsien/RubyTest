require 'simplecov'
SimpleCov.start
require_relative "../lib/user"
require_relative "../lib/user_helper"
require_relative "../lib/user_repository"
require "json"


#unit: <mockujemy UserHelpera>
#    czy initialize poprawnie nadaje wszystkie pola?
#    czy initialize tworzy dynamicznie id, jesli nie podamy?
#    czy json dobrze nam serializuje?
#    czy wszystkie pola sie zgadzaja?


#testy jednostkowe
describe User do

  describe ".new" do
    let (:user) {User.new(id: 1,login: "ik",password: "ooo")}
    before do
      allow_any_instance_of(UserHelper).to receive(:get_id).and_return(0)
    end
    it "returns instance of user class" do
      expect(User.new(id: 1,login: "ik",password: "ooo")).to be_a_kind_of(User)
    end

    it "initializes properly" do
      expect(user.id).to eq(1)
      expect(user.login).to eq("ik")
      expect(user.password).to eq("ooo")
    end

    context "id not given" do
      before do
        allow(UserHelper).to receive(:get_id).and_return(0)

        #require 'pry'; binding.pry
        subject { User.new(login: "ik", password: "ooo") }
      end
      it "sets id dynamically if not given in params" do
        expect(subject.id).to eq(1)
      end
    end
  end

  describe ".to_json" do
    let (:user) {User.new(id: 1,login: "ik",password: "ooo")}
    it "returns json string" do
      expect(user.to_json).to be_a_kind_of(String)
    end

    it "properly serializes user" do
      expect(JSON.parse(user.to_json)["id"]).to eq(1)
      expect(JSON.parse(user.to_json)["login"]).to eq("ik")
      expect(JSON.parse(user.to_json)["password"]).to eq("ooo")
    end
  end
end
