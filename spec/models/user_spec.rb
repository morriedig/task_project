require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新增 User 功能" do
    it "可以新增user" do
      User.create( name: "john", password: "12345678" )
      expect( User.count ).to eq(1)
    end

    it "名字不可空白" do
      User.create( password: "12345678" )
      expect( User.count ).to eq(0)
    end
    
    it "名字不可重複" do
      2.times { User.create( name: "john", password: "12345678" ) }
      expect( User.count ).to eq(1)
    end
    it "密碼不可空白" do
      User.create( name: "john" )
      expect( User.count ).to eq(0)
    end
  end
end
