class DevRecord<ApplicationRecord
  self.abstract_class = true
  connects_to database: { writing: :dev, reading: :dev }
end
