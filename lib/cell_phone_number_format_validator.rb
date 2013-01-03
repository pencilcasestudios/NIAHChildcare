# US phone number (no brackets) at least 7 digits long
# Just capture the number as a person would enter it when make a call (optional leading '+')
class CellPhoneNumberFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^[\+]?\d{7,14}/
      object.errors[attribute] << (options[:message] || I18n.t("validators.cell_phone_number_format.error"))
    end
  end
end
