# Ref: https://github.com/jnicklas/carrierwave/wiki/How-to%3A-Create-random-and-unique-filenames-for-all-versioned-files
# Ref: https://github.com/jnicklas/carrierwave/wiki/How-To%3A-Secure-Upload

require "carrierwave/processing/mime_types"

class ResumeUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes

  process :set_content_type
  storage :file

  def extension_white_list
    %w(doc txt pdf)
  end

  def store_dir
    "#{Rails.root}/uploads/#{model.class.name.downcase}/#{model.id}"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads/cache/#{model.class.name.downcase}/#{model.id}"
  end

  def filename
    if original_filename
      if model && model.read_attribute(:avatar).present?
        model.read_attribute(:avatar)
      else
       "#{secure_token}.#{file.extension}" if original_filename.present?
      end
    end
  end

 protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
