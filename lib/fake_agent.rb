# frozen_string_literal: true

require_relative "version"
require "json"

module FakeAgent
  class FakeAgent
    @browsers = %w[edge chrome safari firefox]
    @os = %w[windows macos linux android ios]
    @platforms = %w[pc mobile tablet]
    agents = File.read(File.join(__dir__, "browsers.json"))
    @data = JSON.parse(agents)

    class << self
      def random
        get_agent(@data)
      end

      def chrome
        get_agent(@data.select { |x| x["browser"] == "chrome" })
      end

      def safari
        get_agent(@data.select { |x| x["browser"] == "safari" })
      end

      def firefox
        get_agent(@data.select { |x| x["browser"] == "firefox" })
      end

      def edge
        get_agent(@data.select { |x| x["browser"] == "edge" })
      end

      def duckduckgo
        get_agent(@data.select { |x| x["browser"].downcase.include? "duckduckgo" })
      end

      def windows
        get_agent(@data.select { |x| x["os"] == "win10" || x["os"] == "win11" })
      end

      def macos
        get_agent(@data.select { |x| x["os"] == "macos" })
      end

      def linux
        get_agent(@data.select { |x| x["os"] == "linux" })
      end

      def android
        get_agent(@data.select { |x| x["os"] == "android" })
      end

      def ios
        get_agent(@data.select { |x| x["os"] == "ios" })
      end

      def pc
        get_agent(@data.select { |x| x["type"] == "pc" })
      end

      def mobile
        get_agent(@data.select { |x| x["type"] == "mobile" })
      end

      def tablet
        get_agent(@data.select { |x| x["type"] == "tablet" })
      end

      private

      def get_agent(browsers)
        browsers[Random.rand(browsers.length)]["useragent"]
      end
    end
  end

  def self.version
    VERSION
  end
end
