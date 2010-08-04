require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Authtools" do 
  describe "Password" do 
    it "should be properly extended by Authtools::Common" do 
      Authtools::Password.should respond_to :salt
    end 
    
    before do 
      @hash = Authtools::Password.generate('secret')
    end
    
    it "should allow to generate hash based on given string" do 
      @hash.should_not be_nil
      @hash.size.should == 192
    end 
    
    it "should allow to retrieve salt from stored hash" do 
      salt = Authtools::Password.get_salt(@hash)
      salt.should_not be_nil
      salt.size.should == 64
      @hash.match(/#{salt}\Z/).should_not be_nil 
    end
    
    it "should allow to check if given hash was generated from specified password" do 
      Authtools::Password.check('secret', @hash).should == true
      Authtools::Password.check('not secret', @hash).should == false
    end 
  end
  
  describe "Token" do 
    it "should be properly extended by Authtools::Common" do 
      Authtools::Token.should respond_to :salt
    end
    
    it "should define shortcuts for each token size" do 
      Authtools::Token.should respond_to :tiny
      Authtools::Token.should respond_to :short
      Authtools::Token.should respond_to :medium
      Authtools::Token.should respond_to :long
    end
    
    it "should allow to generate 128bit random token" do 
      Authtools::Token.generate(:tiny).size.should == 32
      Authtools::Token.tiny.size.should == 32
    end
    
    it "should allow to generate 256bit random token" do 
      Authtools::Token.generate(:short).size.should == 64
      Authtools::Token.short.size.should == 64
    end
    
    it "should allow to generate 384bit random token" do 
      Authtools::Token.generate(:medium).size.should == 96
      Authtools::Token.medium.size.should == 96
    end
    
    it "should allow to generate 512bit random token" do 
      Authtools::Token.generate(:long).size.should == 128
      Authtools::Token.long.size.should == 128
    end 
    
    it "should generate 256bit token by default" do 
      Authtools::Token.generate.size.should == 64
    end
  end
  
  describe "Common" do 
    include Authtools::Common
    
    it "should provide method for generating pseudo-random salt" do
      salt.should_not be_nil
      salt.size.should == 64
    end
  end
end
