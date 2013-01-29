class Guardian < ActiveRecord::Base
  belongs_to :family_profile

  attr_accessible :full_name
  attr_accessible :occupation
  attr_accessible :role

  ROLES = {
    # Translation                                     # Database key
    I18n.t("models.guardian.roles.father")     =>     "father",
    I18n.t("models.guardian.roles.guardian")   =>     "guardian",
    I18n.t("models.guardian.roles.mother")     =>     "mother",
  }
end
