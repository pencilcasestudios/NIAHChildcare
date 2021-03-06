class NannyProfilesController < ApplicationController
  before_filter :sign_in_required

  load_and_authorize_resource

  def new
    @nanny_profile.full_name = current_user.full_name

    @nanny_profile.addresses.build(phone: current_user.cell_phone_number, email: current_user.email)
    #@nanny_profile.educations.build
    #@nanny_profile.employers.build
    #@nanny_profile.references.build
  end

  def create
    @nanny_profile.user = current_user
    if @nanny_profile.save
      flash[:success] = t("controllers.nanny_profiles_controller.actions.create.success")
      redirect_to @nanny_profile
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @nanny_profile.update_attributes(params[:nanny_profile])
      flash[:success] = t("controllers.nanny_profiles_controller.actions.update.success")
      redirect_to @nanny_profile
    else
      render action: "edit"
    end
  end

  def resume
    nanny_profile = NannyProfile.find(params[:id])

    # Build the resume file name
    resume = t("controllers.nanny_profiles_controller.actions.resume.copy.resume")
    owner_name = nanny_profile.user.full_name
    timestamp = Time.now.strftime("%d %B %Y %H%M")
    extension = nanny_profile.resume.file.extension.downcase

    # Determine the MIME type
    mime = MIME::Types.type_for(nanny_profile.resume.url).first.content_type


    filename = "#{resume} - #{owner_name} (#{timestamp}).#{extension}"

    # Let the user download it
    send_file( nanny_profile.resume.url,
      disposition: "attachment", # Download the file instead of showing it in the browser
      filename: filename,
      type: mime,
      x_sendfile: true,
    )
   end
end
