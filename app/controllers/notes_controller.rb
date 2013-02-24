class NotesController < ApplicationController
  before_filter :admin_required
  before_filter :sign_in_required

  load_and_authorize_resource

  def index
    @note = Note.new
    @noteable = find_noteable
    @notes = @noteable.notes
  end

  def show
  end

  def new
    @noteable = find_noteable
  end

  def create
    @noteable = find_noteable
    @note = @noteable.notes.build(params[:note])
    @note.user = current_user
    if @note.save
      flash[:success] = t("controllers.notes_controller.actions.create.success")
      redirect_to id: nil
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @note.update_attributes(params[:note])
      flash[:success] = t("controllers.notes_controller.actions.update.success")
      redirect_to(@note)
    else
      render action: "edit"
    end
  end

private

  # Ref: http://railscasts.com/episodes/154-polymorphic-association
  def find_noteable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
