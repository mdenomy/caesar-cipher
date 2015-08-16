require 'spec_helper'

describe CaesarCipher do

  describe "encryption" do
    before do
     @cypher = CaesarCipher.new(3)
    end

    it "shifts alpha characters" do
      expect(@cypher.encrypt("abcd")).to eq "defg"
      expect(@cypher.decrypt("defg")).to eq "abcd"
    end

    it "wraps after z" do
      expect(@cypher.encrypt("xyz")).to eq "abc"
    end

    it "handles upper and lower characters" do
      expect(@cypher.encrypt("aBcXyZ")).to eq "dEfAbC"
    end

    it "leaves non alpha characters alone" do
      expect(@cypher.encrypt("123 ,{|}")).to eq "123 ,{|}"
    end
  end

  describe "decryption" do
    before do
     @cypher = CaesarCipher.new(3)
    end

    it "shifts alpha characters" do
      expect(@cypher.decrypt("defg")).to eq "abcd"
    end

    it "wraps after z" do
      expect(@cypher.decrypt("abc")).to eq "xyz"
    end

    it "handles upper and lower characters" do
      expect(@cypher.decrypt("dEfAbC")).to eq "aBcXyZ"
    end

    it "leaves non alpha characters alone" do
      expect(@cypher.decrypt("123 ,{|}")).to eq "123 ,{|}"
    end
  end

  it "works with larger shifts" do
    cypher = CaesarCipher.new(54)
    expect(cypher.encrypt("abcd")).to eq "cdef"
    expect(cypher.decrypt("cdef")).to eq "abcd"
  end

  it "works with negative shifts" do
    cypher = CaesarCipher.new(-2)
    expect(cypher.encrypt("abcd")).to eq "yzab"
    expect(cypher.decrypt("yzab")).to eq "abcd"
  end

end
