require 'json'

class FakeRequestHelper
  def self.read name
    JSON.parse File.read "test/fixtures/#{name}.json"
  end
end
