class Responder < ActiveRecord::Base
  self.primary_key = 'name'
  self.inheritance_column = :_type_disabled

  validates :name, presence: true, uniqueness: true
  validates :type, presence: true
  validates :capacity, presence: true, inclusion: (1..5).to_a

  def as_json(options = nil)
    { "responder" => {"emergency_code" => self.emergency_code,
                  "type" => self.type,
                  "name" => self.name,
                  "capacity" => self.capacity,
                  "on_duty" => self.on_duty } }
  end
end
