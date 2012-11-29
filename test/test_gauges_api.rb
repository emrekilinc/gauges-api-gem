require 'minitest/autorun'
require 'minitest/colorize'
require 'gauges_api'
require 'helper'

module Gauges
  class ClientTest < MiniTest::Unit::TestCase
    TOKEN = "b078b3daa71689977fbbf6037fcd71bf"

    def test_initialize_with_token
      client = Client.new TOKEN

      assert_equal client.token, TOKEN
    end

    def test_throw_exception_without_token
      assert_raises(ArgumentError) { cl = Gauges::Client.new }
    end

    def test_me_data
      sample = FakeRequestHelper.read 'me'

      # Do not hit the network
      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:me) { sample }
      end

      me = klass.new(TOKEN).me

      assert_equal "John Doe", me["user"]["name"]
      assert_equal "john@doe.com", me["user"]["email"]
      assert_operator me["user"]["urls"].count, :>, 0
    end
    
    def test_clients_data
      sample = FakeRequestHelper.read 'clients'

      # Do not hit the network
      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:clients) { sample }
      end

      clients = klass.new(TOKEN).clients

      assert_equal "Campfire", clients["clients"][0]["description"]
      assert_equal "8ee4648f95733342b2f9f9b3ea8b82b3", clients["clients"][0]["key"]
    end
    
    def test_gauges_data
      tc = self
      sample = FakeRequestHelper.read 'gauges'

      # Do not hit the network
      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:gauges) do |page = 1|
          tc.assert_equal 1, page
          sample
        end
      end

      # Call with no arguments
      gauges = klass.new(TOKEN).gauges

      assert_equal false, gauges["gauges"].nil?
    end

    def test_shares_data_4e206261e5947c1d38000001
      tc = self
      sample = FakeRequestHelper.read 'shares'

      # Do not hit the network
      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:shares) do |id|
          tc.assert_equal "4e206261e5947c1d38000001", id
          sample
        end
      end
      
      shares = klass.new(TOKEN).shares "4e206261e5947c1d38000001"

      assert_equal false , shares["shares"].nil?
    end

    def test_content_data_4e206261e5947c1d38000001
      tc = self
      sample = FakeRequestHelper.read 'content'

      # Do not hit the network
      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:content) do |id, date = '2012-11-29', page = 1|
          tc.assert_equal "4e206261e5947c1d38000001", id
          tc.assert_equal "2012-11-29", date
          tc.assert_equal 1, page
          sample
        end
      end

      content = klass.new(TOKEN).content "4e206261e5947c1d38000001", "2012-11-29"

      assert_equal false, content["content"].nil?
    end

    def test_referrer_data_4e206261e5947c1d38000001
      tc = self
      sample = FakeRequestHelper.read 'referrers'

      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:referrers) do |id, date = '2012-11-29', page = 1|
          tc.assert_equal "4e206261e5947c1d38000001", id
          tc.assert_equal "2012-11-29", date
          tc.assert_equal 1, page
          sample
        end
      end

      referrers = klass.new(TOKEN).referrers "4e206261e5947c1d38000001", "2012-11-29"

      assert_equal false, referrers["referrers"].nil?
    end

    def test_traffic_data_4e206261e5947c1d38000001
      tc = self
      sample = FakeRequestHelper.read 'traffic'

      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:traffic) do |id, date = '2012-11-29'|
          tc.assert_equal "4e206261e5947c1d38000001", id
          tc.assert_equal "2012-11-29", date
          sample
        end
      end

      traffic = klass.new(TOKEN).traffic "4e206261e5947c1d38000001", "2012-11-29"

      assert_equal false, traffic["traffic"].nil?
      assert_equal 577, traffic["views"]
      assert_equal 14, traffic["people"]
    end

    def test_resolution_data_4e206261e5947c1d38000001
      tc = self
      sample = FakeRequestHelper.read 'resolutions'

      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:resolutions) do |id, date = '2012-11-29'|
          tc.assert_equal "4e206261e5947c1d38000001", id
          tc.assert_equal "2012-11-29", date
          sample
        end
      end

      resolutions = klass.new(TOKEN).resolutions "4e206261e5947c1d38000001", "2012-11-29"

      assert_equal false, resolutions["browser_heights"].nil?
      assert_equal false, resolutions["browser_widths"].nil?
      assert_equal false, resolutions["screen_widths"].nil?
    end

    def test_technology_data_4e206261e5947c1d38000001
      tc = self
      sample = FakeRequestHelper.read 'technology'

      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:technology) do |id, date = '2012-11-29'|
          tc.assert_equal "4e206261e5947c1d38000001", id
          tc.assert_equal "2012-11-29", date
          sample
        end
      end

      technology = klass.new(TOKEN).technology "4e206261e5947c1d38000001", "2012-11-29"

      assert_equal false, technology["browsers"].nil?
      assert_equal false, technology["platforms"].nil?
    end

    def test_terms_data_4e206261e5947c1d38000001
      tc = self
      sample = FakeRequestHelper.read 'terms'

      # Do not hit the network
      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:terms) do |id, date = '2012-11-29', page = 1|
          tc.assert_equal "4e206261e5947c1d38000001", id
          tc.assert_equal "2012-11-29", date
          tc.assert_equal 1, page
          sample
        end
      end

      terms = klass.new(TOKEN).terms "4e206261e5947c1d38000001", "2012-11-29"

      assert_equal false, terms["terms"].nil?
    end
    
    def test_engines_data_4e206261e5947c1d38000001
      tc = self
      sample = FakeRequestHelper.read 'engines'

      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:engines) do |id, date = '2012-11-29'|
          tc.assert_equal "4e206261e5947c1d38000001", id
          tc.assert_equal "2012-11-29", date
          sample
        end
      end

      engines = klass.new(TOKEN).engines "4e206261e5947c1d38000001", "2012-11-29"

      assert_equal false, engines["engines"].nil?
    end

    def test_locations_data_4e206261e5947c1d38000001
      tc = self
      sample = FakeRequestHelper.read 'locations'

      # Mock the class method on the fly
      klass = Class.new(Client) do
        define_method(:locations) do |id, date = '2012-11-29'|
          tc.assert_equal "4e206261e5947c1d38000001", id
          tc.assert_equal "2012-11-29", date
          sample
        end
      end

      locations = klass.new(TOKEN).locations "4e206261e5947c1d38000001", "2012-11-29"

      assert_equal false, locations["locations"].nil?
    end


  end
end
