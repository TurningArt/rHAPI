require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RHapi::Lead" do
  
  context "connection" do
    before do
      RHapi.configure do |config|
        config.api_key = test_config["api_key"]
        config.hub_spot_site = "http://mysite.hubspot.com"
      end
      @url = "https://hubapi.com/leads/v1/list?hapikey=#{test_config["api_key"]}"
    end
    it "should generate a url with a search param" do
      url = RHapi::Lead.url_for("list", nil, {:search => "test"})
      url.should == @url << "&search=test"
    end
    it "should generate a url with multiple params" do
      url = RHapi::Lead.url_for("list", nil, {:search => "test", :sort => "firstName", :dir => "asc", :max => 10})
      url.include?("&sort=firstName").should == true
      url.include?("&search=test").should == true
      url.include?("&dir=asc").should == true
      url.include?("&max=10").should == true
    end
    it "should generate a url with an id" do
      url = RHapi::Lead.url_for("lead", "myid")
      url.should == "https://hubapi.com/leads/v1/lead/myid?hapikey=#{test_config["api_key"]}"
    end
    it "should raise a url error if options is not a hash" do
      lambda {RHapi::Lead.url_for("list", nil, nil)}.should raise_error(RHapi::UriError)
    end
  end
  
  context "when searching for leads" do
    before do
      RHapi.configure do |config|
        config.api_key = test_config["api_key"]
        config.hub_spot_site = "http://mysite.hubspot.com"
      end
      stub_leads_search
    end
    
    # Most of the actual connections are mocked to spped tests.
    it "should return all leads with no search params" do
      leads = RHapi::Lead.find
      leads.length.should >= 1
    end
    
    it "should have a first_name attribute" do
      leads = RHapi::Lead.find
      leads.first.first_name.should == "Fred"
    end
    
    it "should set the value for a first name" do
      leads = RHapi::Lead.find
      lead = leads.first
      lead.first_name = "Barny"
      lead.first_name.should == "Barny" 
    end
    
    it "should have analytics details" do
      # Not sure yet how these will be used. I may want to make
      # attributes that are hashes or arrays seem more like lead attributes.
      leads = RHapi::Lead.find
      lead = leads.first
      lead.analytics_details.length.should == 12
      lead.analytics_details["allViewsImported"].should == true
    end
  
  end
  
  context "updating a lead" do
    
    before do
      RHapi.configure do |config|
        config.api_key = test_config["api_key"]
        config.hub_spot_site = "http://mysite.hubspot.com"
      end
      stub_leads_search
    end
    
    it "should have a list of changed attributes" do
      leads = RHapi::Lead.find
      lead = leads.first
      lead.first_name = "Barny"
      lead.last_name = "Rubble"
      lead.changed_attributes.length.should == 2
      lead.changed_attributes["firstName"].should == "Barny"
    end
    
    it "should update a lead" do
      stub_lead_update
      leads = RHapi::Lead.find
      lead = leads.first
      lead.first_name = "Adam"
      lead.last_name = "Enbar"
      lead.update.should == true
    end
    
    it "should have a list of changed attributes when updating with a params hash" do
      stub_lead_update
      leads = RHapi::Lead.find
      lead = leads.first
      lead.update({:first_name => "Wilma", :last_name => "Flintstone", :city => "Bedrock", :state => "CA"}).should == true
      lead.changed_attributes.length.should == 4
      lead.changed_attributes["firstName"].should == "Wilma"
      lead.changed_attributes["firstName"].should == "Wilma"
      lead.changed_attributes["city"].should == "Bedrock"
      lead.changed_attributes["state"].should == "CA"
    end
    
    it "should raise an error if 200 is not returned" do
      leads = RHapi::Lead.find
      lead = leads.first
      lead.first_name = "Barny"
      lead.last_name = "Rubble"
      lead.guid = "wrong"
      stub_lead_update_error
      
      lambda {lead.update}.should raise_error(RHapi::ConnectionError)
    end
    
  end
  
  context "get lead information with guid" do
    before do
      RHapi.configure do |config|
        config.api_key = test_config["api_key"]
        config.hub_spot_site = "http://mysite.hubspot.com"
      end
      stub_leads_search
    end
    
    it "should return a lead" do
      leads = RHapi::Lead.find
      stub_leads_find_by_guid
      lead = RHapi::Lead.find_by_guid(leads.first.guid)
      lead.first_name.should == "Fred"
    end
    
    it "should raise an error if an error string is returned" do
      stub_leads_error
      lambda {RHapi::Lead.find_by_guid("badguid")}.should raise_error(RHapi::ConnectionError)
    end
  end
  
  
  context "accessing leads with incorrect API key" do
    before do
     RHapi.configure do |config|
        config.api_key = "badapikey"
        config.hub_spot_site = "http://mysite.hubspot.com"
      end
    end
    
    it "should raise an exception" do
      stub_leads_error
      lambda {RHapi::Lead.find}.should raise_error(RHapi::ConnectionError)
    end
  end
  
  
end
