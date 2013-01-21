class WelcomeController < ApplicationController
  before_filter :sign_out_required, only: [:register]

  skip_authorization_check

  def index
  end

  def about
  end

  def fees
  end

  def nannies
  end

  def register
  end

  def terms
  end

  def contact
  end
end
