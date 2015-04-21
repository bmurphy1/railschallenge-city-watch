class Responder < ActiveRecord::Base
  self.primary_key = 'name'
  self.inheritance_column = :_type_disabled
end
