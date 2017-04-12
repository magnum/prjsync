class Channel
  include Mongoid::Document
  field :code, type: String
  field :name, type: String

  def projects
    "#{self.code.capitalize}Synchronizer".constantize.new.projects
  end


end
