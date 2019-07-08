# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def downcase_name
    self.name = name.downcase
  end 
end
