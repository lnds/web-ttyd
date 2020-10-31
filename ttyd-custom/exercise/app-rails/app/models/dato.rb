class Dato
  include Mongoid::Document
  field :codigo, type: Integer
  field :nombre, type: String
  field :cuando, type: Time
end
