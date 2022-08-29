class Question < ApplicationRecord
  before_save :default_values
  def default_values
    self.visible = true if self.visible.nil?
  end
end
