require "spec_helper"

describe "Assets" do
  # In app/assets/stylesheets/
  describe "app/assets/stylesheets/" do
    it "has stylesheet assets" do
      get "/assets/styles.css"
      response.status.should be(200)

      get "/assets/users.css"
      response.status.should be(200)

      get "/assets/sessions.css"
      response.status.should be(200)
    end
  end

  # In app/assets/
  describe "app/assets/fonts/" do
    it "has font assets" do
      # Test that fonts are present
      get "/assets/Just_Me_Again_Down_Here/Just_Me_Again_Down_Here.ttf"
      response.status.should be(200)
    end
  end

  # In app/assets/images/
  describe "app/assets/images/" do
    it "has image assets" do
      # Favicons and meta-tags images
      get "/assets/apple-touch-icon.png"
      response.status.should be(200)

      get "/assets/apple-touch-icon-72x72.png"
      response.status.should be(200)

      get "/assets/apple-touch-icon-114x114.png"
      response.status.should be(200)

      get "/assets/favicon.ico"
      response.status.should be(200)

      get "/assets/logo-340x340.png"
      response.status.should be(200)


      # Images
      get "/assets/NIAHChildcare_logo_with_text-930x539.png"
      response.status.should be(200)

      # Background images
      get "/assets/backgrounds/01.jpg"
      response.status.should be(200)

      get "/assets/backgrounds/02.jpg"
      response.status.should be(200)

      get "/assets/backgrounds/03.jpg"
      response.status.should be(200)

      get "/assets/backgrounds/04.jpg"
      response.status.should be(200)

      get "/assets/backgrounds/05.jpg"
      response.status.should be(200)

      get "/assets/backgrounds/06.jpg"
      response.status.should be(200)

      get "/assets/backgrounds/07.jpg"
      response.status.should be(200)

      get "/assets/backgrounds/08.jpg"
      response.status.should be(200)

      get "/assets/backgrounds/09.jpg"
      response.status.should be(200)

      get "/assets/backgrounds/10.jpg"
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

  # In Vegas assets
  describe "Vegas assets" do
    it "are available" do
      # Stylesheets
      get "/assets/vegas.css"
      response.status.should be(200)

      # Javascripts
      get "/assets/vegas.js"
      response.status.should be(200)

      # Images
      get "/assets/loading.gif"
      response.status.should be(200)

      get "/assets/overlays/01.png"
      response.status.should be(200)

      get "/assets/overlays/02.png"
      response.status.should be(200)

      get "/assets/overlays/03.png"
      response.status.should be(200)

      get "/assets/overlays/04.png"
      response.status.should be(200)

      get "/assets/overlays/05.png"
      response.status.should be(200)

      get "/assets/overlays/06.png"
      response.status.should be(200)

      get "/assets/overlays/07.png"
      response.status.should be(200)

      get "/assets/overlays/08.png"
      response.status.should be(200)

      get "/assets/overlays/09.png"
      response.status.should be(200)

      get "/assets/overlays/10.png"
      response.status.should be(200)

      get "/assets/overlays/11.png"
      response.status.should be(200)

      get "/assets/overlays/12.png"
      response.status.should be(200)

      get "/assets/overlays/13.png"
      response.status.should be(200)

      get "/assets/overlays/14.png"
      response.status.should be(200)

      get "/assets/overlays/15.png"
      response.status.should be(200)
    end
  end
end
