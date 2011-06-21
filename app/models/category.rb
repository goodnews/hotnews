class Category < ActiveRecord::Base
  has_many :properties
  accepts_nested_attributes_for :properties, :allow_destroy => true
  has_many :products
end