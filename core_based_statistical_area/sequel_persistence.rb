require "sequel"

class SequelPersistence
  DB = Sequel.connect("postgres://localhost/cbsa")

  DB.disconnect

  def initialize(logger)
    DB.logger = logger
  end

  def all_populatations
    DB[:metro_area].all
  end


end
