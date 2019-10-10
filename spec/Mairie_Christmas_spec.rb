require_relative '../lib/Mairie_Christmas.rb'

describe "the get_mairie_names method" do
  it "should return an Array" do
    expect(get_mairie_names).to be_instance_of Array end
  it "should not be nil" do 
  	expect(get_mairie_names).not_to be_nil end
end

describe "the get_mairie_urls method" do
  it "should return an Array" do
    expect(get_mairie_urls).to be_instance_of Array end
  it "should not be nil" do 
  	expect(get_mairie_urls).not_to be_nil end
end

describe "the get_mairie_emails method" do
  it "should return an Array" do
    expect(get_mairie_emails).to be_instance_of Array end
  it "should not be nil" do 
  	expect(get_mairie_emails).not_to be_nil end
end