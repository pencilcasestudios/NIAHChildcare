require "spec_helper"

describe "Assets" do
  # In app/assets/stylesheets/
  describe "app/assets/stylesheets/" do
    it "has stylesheet assets" do
      #get "/assets/sessions.css"
      #response.status.should be(200)
      #
      #get "/assets/styles.css"
      #response.status.should be(200)
      #
      #get "/assets/users.css"
      #response.status.should be(200)
      #
      #get "/assets/jobs.css"
      #response.status.should be(200)
      #
      #get "/assets/organisations.css"
      #response.status.should be(200)
    end
  end

  # In app/assets/
  describe "app/assets/fonts/" do
    it "has font assets" do
      # Test that fonts are present
    end
  end

  # In app/assets/images/
  describe "app/assets/images/" do
    it "has image assets" do
      get "/assets/apple-touch-icon.png"
      response.status.should be(200)

      get "/assets/apple-touch-icon-72x72.png"
      response.status.should be(200)

      get "/assets/apple-touch-icon-114x114.png"
      response.status.should be(200)

      get "/assets/favicon.ico"
      response.status.should be(200)
    end
  end

  # In Foundation, from ZURB assets
  describe "Foundation assets" do
    it "are available" do
      get "/assets/foundation_and_overrides.css"
      response.status.should be(200)

      get "/assets/foundation.js"
      response.status.should be(200)

      get "/assets/foundation/app.js"
      response.status.should be(200)
    end
  end
end
