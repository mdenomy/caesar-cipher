require 'spec_helper'

describe CaesarCipher do

  describe "encryption" do
    before do
     @cipher = CaesarCipher.new(3)
    end

    it "shifts alpha characters" do
      expect(@cipher.encrypt("abcd")).to eq "defg"
      expect(@cipher.decrypt("defg")).to eq "abcd"
    end

    it "wraps after z" do
      expect(@cipher.encrypt("xyz")).to eq "abc"
    end

    it "handles upper and lower characters" do
      expect(@cipher.encrypt("aBcXyZ")).to eq "dEfAbC"
    end

    it "leaves non alpha characters alone" do
      expect(@cipher.encrypt("123 ,{|}")).to eq "123 ,{|}"
    end
  end

  describe "decryption" do
    before do
     @cipher = CaesarCipher.new(3)
    end

    it "shifts alpha characters" do
      expect(@cipher.decrypt("defg")).to eq "abcd"
    end

    it "wraps after z" do
      expect(@cipher.decrypt("abc")).to eq "xyz"
    end

    it "handles upper and lower characters" do
      expect(@cipher.decrypt("dEfAbC")).to eq "aBcXyZ"
    end

    it "leaves non alpha characters alone" do
      expect(@cipher.decrypt("123 ,{|}")).to eq "123 ,{|}"
    end
  end

  it "works with larger shifts" do
    cipher = CaesarCipher.new(54)
    expect(cipher.encrypt("abcd")).to eq "cdef"
    expect(cipher.decrypt("cdef")).to eq "abcd"
  end

  it "works with negative shifts" do
    cipher = CaesarCipher.new(-2)
    expect(cipher.encrypt("abcd")).to eq "yzab"
    expect(cipher.decrypt("yzab")).to eq "abcd"
  end

end
