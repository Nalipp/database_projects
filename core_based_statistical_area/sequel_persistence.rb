require "sequel"

class SequelPersistence
  DB = Sequel.connect("postgres://localhost/cbsa")

  DB.disconnect

  def initialize(logger)
    DB.logger = logger
  end

  def geographic_areas
    DB[:metro_area].map { |line| line[:geographic_area] }
  end

  def all_populatations
    DB[:metro_area].all
  end
end
