require 'spec_helper'

describe "TutorialMedias" do
  describe "GET /tutorial_medias" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get tutorial_medias_path
      response.status.should be(200)
    end
  end
end
