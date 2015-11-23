require_relative "../lib/user"
require "json"


describe User do
  let (:user) {User.new(id: 1,login: "ik",password: "ooo")}
  describe ".to_json" do
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
