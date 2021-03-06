require 'spec_helper'

describe MediasController do

  def mock_media(stubs={})
    (@mock_media ||= mock_model(Media).as_null_object).tap do |media|
      media.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all medias as @medias" do
      Media.stub(:all) { [mock_media] }
      get :index
      assigns(:medias).should eq([mock_media])
    end
  end

  describe "GET show" do
    it "assigns the requested media as @media" do
      Media.stub(:find).with("37") { mock_media }
      get :show, :id => "37"
      assigns(:media).should be(mock_media)
    end
  end

  describe "GET new" do
    it "assigns a new media as @media" do
      Media.stub(:new) { mock_media }
      get :new
      assigns(:media).should be(mock_media)
    end
  end

  describe "GET edit" do
    it "assigns the requested media as @media" do
      Media.stub(:find).with("37") { mock_media }
      get :edit, :id => "37"
      assigns(:media).should be(mock_media)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created media as @media" do
        Media.stub(:new).with({'these' => 'params'}) { mock_media(:save => true) }
        post :create, :media => {'these' => 'params'}
        assigns(:media).should be(mock_media)
      end

      it "redirects to the created media" do
        Media.stub(:new) { mock_media(:save => true) }
        post :create, :media => {}
        response.should redirect_to(media_url(mock_media))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved media as @media" do
        Media.stub(:new).with({'these' => 'params'}) { mock_media(:save => false) }
        post :create, :media => {'these' => 'params'}
        assigns(:media).should be(mock_media)
      end

      it "re-renders the 'new' template" do
        Media.stub(:new) { mock_media(:save => false) }
        post :create, :media => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested media" do
        Media.should_receive(:find).with("37") { mock_media }
        mock_media.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :media => {'these' => 'params'}
      end

      it "assigns the requested media as @media" do
        Media.stub(:find) { mock_media(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:media).should be(mock_media)
      end

      it "redirects to the media" do
        Media.stub(:find) { mock_media(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(media_url(mock_media))
      end
    end

    describe "with invalid params" do
      it "assigns the media as @media" do
        Media.stub(:find) { mock_media(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:media).should be(mock_media)
      end

      it "re-renders the 'edit' template" do
        Media.stub(:find) { mock_media(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested media" do
      Media.should_receive(:find).with("37") { mock_media }
      mock_media.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the medias list" do
      Media.stub(:find) { mock_media }
      delete :destroy, :id => "1"
      response.should redirect_to(medias_url)
    end
  end

end
