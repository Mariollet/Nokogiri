require_relative '../lib/Dark_Trader.rb'

describe "the crypto_name_scrapper method" do
  it "should return an array" do
    expect(crypto_name_scrapper).to be_instance_of Array end
  it "should not be nil" do 
  	expect(crypto_name_scrapper).not_to be_nil end
end

describe "the crypto_price_scrapper method" do
  it "should return an array" do
    expect(crypto_price_scrapper).to be_instance_of Array end
  it "should not be nil" do 
  	expect(crypto_price_scrapper).not_to be_nil end
end

describe "the crypto_all method" do
  it "should return an array" do
    expect(crypto_all).to be_instance_of Array end
  it "should not be nil" do 
  	expect(crypto_all).not_to be_nil end
end