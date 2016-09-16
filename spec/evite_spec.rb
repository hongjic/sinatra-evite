require File.dirname(__FILE__) + '/../app'
require 'rspec'

describe "app" do 

  describe "test" do
    it "should 1+1=2" do
      expect(1+1).to eq 2
    end
  end
end