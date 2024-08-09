# frozen_string_literal: true

require_relative "version"
require "json"

module FakeAgent
  class FakeAgent
    @browsers = %w[edge chrome safari firefox opera]
    @systems = %w[windows macos linux android ios]
    @platforms = %w[desktop mobile tablet]
    agents = File.read(File.join(__dir__, "browsers.json"))
    @data = JSON.parse(agents)

    class << self
      ##
      # Produces a random user agent
      #
      # @param browsers [Array<String>, String, nil]
      # @param systems [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.random
      # @example
      #   FakeAgent::FakeAgent.random(browsers: "chrome")
      # @example
      #   FakeAgent::FakeAgent.random(browsers: %w[chrome safari firefox opera edge])
      # @example
      #   FakeAgent::FakeAgent.random(systems: "windows")
      # @example
      #   FakeAgent::FakeAgent.random(systems: %w[windows macos linux android ios])
      # @example
      #   FakeAgent::FakeAgent.random(platforms: "mobile")
      # @example
      #   FakeAgent::FakeAgent.random(platforms: %w[desktop mobile tablet])
      # @example
      #   FakeAgent::FakeAgent.random(browsers: "chrome", systems: "windows", platforms: "desktop")
      # @example
      #   FakeAgent::FakeAgent.random(browsers: %w[chrome safari firefox opera edge], systems: "windows", platforms: "desktop")
      # @example
      #   FakeAgent::FakeAgent.random(browsers: %w[chrome firefox], systems: %w[windows macos])
      def random(browsers: @browsers, systems: @systems, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: Array(systems), platforms: Array(platforms))
      end

      # Generates a user agent string for Chrome
      #
      # @param systems [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.chrome
      # @example
      #   FakeAgent::FakeAgent.chrome(systems: "windows")
      # @example
      #   FakeAgent::FakeAgent.chrome(systems: %w[windows macos linux android ios])
      # @example
      #   FakeAgent::FakeAgent.chrome(platforms: "mobile")
      # @example
      #   FakeAgent::FakeAgent.chrome(platforms: %w[desktop mobile tablet])
      # @example
      #   FakeAgent::FakeAgent.chrome(systems: %w[windows linux], platforms: "desktop")
      def chrome(systems: @systems, platforms: @platforms)
        get_agent(browsers: %w[chrome], systems: Array(systems), platforms: Array(platforms))
      end

      # Generates a user agent string for Safari
      #
      # @param systems [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.safari
      # @example
      #   FakeAgent::FakeAgent.safari(systems: "macos")
      # @example
      #   FakeAgent::FakeAgent.safari(systems: %w[macos ios])
      # @example
      #   FakeAgent::FakeAgent.safari(platforms: "mobile")
      # @example
      #   FakeAgent::FakeAgent.safari(platforms: %w[desktop mobile tablet])
      # @example
      #   FakeAgent::FakeAgent.safari(systems: %w[macos ios], %w[desktop mobile tablet])
      def safari(systems: @systems, platforms: @platforms)
        get_agent(browsers: %w[safari], systems: Array(systems), platforms: Array(platforms))
      end

      # Generates a user agent string for Firefox
      #
      # @param systems [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      # @example
      #   FakeAgent::FakeAgent.firefox
      # @example
      #   FakeAgent::FakeAgent.firefox(systems: "windows")
      # @example
      #   FakeAgent::FakeAgent.firefox(systems: %w[windows macos linux android ios])
      # @example
      #   FakeAgent::FakeAgent.firefox(platforms: "mobile")
      # @example
      #   FakeAgent::FakeAgent.firefox(platforms: %w[desktop mobile tablet])
      # @example
      #   FakeAgent::FakeAgent.firefox(systems: %w[windows linux], platforms: "desktop")
      def firefox(systems: @systems, platforms: @platforms)
        get_agent(browsers: %w[firefox], systems: Array(systems), platforms: Array(platforms))
      end

      # Generates a user agent string for Edge
      #
      # @param systems [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      # @example
      #   FakeAgent::FakeAgent.edge
      # @example
      #   FakeAgent::FakeAgent.edge(systems: "windows")
      # @example
      #   FakeAgent::FakeAgent.edge(systems: %w[windows macos linux android ios])
      # @example
      #   FakeAgent::FakeAgent.edge(platforms: "mobile")
      # @example
      #   FakeAgent::FakeAgent.edge(platforms: %w[desktop mobile tablet])
      # @example
      #   FakeAgent::FakeAgent.edge(systems: %w[windows macos], platforms: "desktop")
      def edge(systems: @systems, platforms: @platforms)
        get_agent(browsers: %w[edge], systems: Array(systems), platforms: Array(platforms))
      end

      # Generates a user agent string for Opera
      #
      # @param systems [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      # @example
      #   FakeAgent::FakeAgent.opera
      # @example
      #   FakeAgent::FakeAgent.opera(systems: "windows")
      # @example
      #   FakeAgent::FakeAgent.opera(systems: %w[windows macos linux android])
      # @example
      #   FakeAgent::FakeAgent.opera(platforms: "desktop")
      # @example
      #   FakeAgent::FakeAgent.opera(platforms: %w[desktop mobile tablet])
      # @example
      #   FakeAgent::FakeAgent.opera(systems: %w[windows linux], platforms: "desktop")
      def opera(systems: @systems, platforms: @platforms)
        get_agent(browsers: %w[opera], systems: Array(systems), platforms: Array(platforms))
      end

      # Generates a user agent string for Windows
      #
      # @param browsers [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.windows
      # @example
      #   FakeAgent::FakeAgent.windows(browsers: "chrome")
      # @example
      #   FakeAgent::FakeAgent.windows(browsers: %w[chrome firefox edge opera])
      # @example
      #   FakeAgent::FakeAgent.windows(platforms: "desktop")
      # @example
      #   FakeAgent::FakeAgent.windows(browsers: %w[chrome firefox edge opera], platforms: "desktop")
      def windows(browsers: @browsers, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: %w[windows], platforms: Array(platforms))
      end

      # Generates a user agent string for MacOS
      #
      # @param browsers [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.macos
      # @example
      #   FakeAgent::FakeAgent.macos(browsers: "chrome")
      # @example
      #   FakeAgent::FakeAgent.macos(browsers: %w[chrome firefox edge safari])
      # @example
      #   FakeAgent::FakeAgent.macos(platforms: "desktop")
      # @example
      #   FakeAgent::FakeAgent.macos(browsers: %w[chrome firefox edge safari], platforms: "desktop")
      def macos(browsers: @browsers, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: %w[macos], platforms: Array(platforms))
      end

      # Generates a user agent string for Linux
      #
      # @param browsers [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.linux
      # @example
      #   FakeAgent::FakeAgent.linux(browsers: "chrome")
      # @example
      #   FakeAgent::FakeAgent.linux(browsers: %w[chrome firefox edge opera])
      # @example
      #   FakeAgent::FakeAgent.linux(platforms: "desktop")
      # @example
      #   FakeAgent::FakeAgent.linux(browsers: %w[chrome firefox edge opera], platforms: "desktop")
      def linux(browsers: @browsers, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: %w[linux], platforms: Array(platforms))
      end

      # Generates a user agent string for Android
      #
      # @param browsers [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.android
      # @example
      #   FakeAgent::FakeAgent.android(browsers: "chrome")
      # @example
      #   FakeAgent::FakeAgent.android(browsers: %w[chrome firefox edge opera])
      # @example
      #   FakeAgent::FakeAgent.android(platforms: "mobile")
      # @example
      #   FakeAgent::FakeAgent.android(browsers: %w[chrome firefox edge opera], platforms: "mobile")
      def android(browsers: @browsers, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: %w[android], platforms: Array(platforms))
      end

      # Generates a user agent string for iOS
      #
      # @param browsers [Array<String>, String, nil]
      # @param platforms [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.ios
      # @example
      #   FakeAgent::FakeAgent.ios(browsers: "chrome")
      # @example
      #   FakeAgent::FakeAgent.ios(browsers: %w[chrome firefox edge safari])
      # @example
      #   FakeAgent::FakeAgent.ios(platforms: "mobile")
      # @example
      #   FakeAgent::FakeAgent.ios(browsers: %w[chrome firefox edge safari], platforms: "mobile")
      def ios(browsers: @browsers, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: %w[ios], platforms: Array(platforms))
      end

      # Generates a user agent string for desktop
      #
      # @param browsers [Array<String>, String, nil]
      # @param systems [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.desktop
      # @example
      #   FakeAgent::FakeAgent.desktop(browsers: "chrome")
      # @example
      #   FakeAgent::FakeAgent.desktop(browsers: %w[chrome firefox edge safari opera])
      # @example
      #   FakeAgent::FakeAgent.desktop(systems: "windows")
      # @example
      #   FakeAgent::FakeAgent.desktop(systems: %w[windows macos linux])
      # @example
      #   FakeAgent::FakeAgent.desktop(browsers: %w[chrome firefox edge opera], systems: "windows")
      def desktop(browsers: @browsers, systems: @systems)
        get_agent(browsers: Array(browsers), systems: Array(systems), platforms: %w[desktop])
      end

      # Generates a user agent string for mobile
      #
      # @param browsers [Array<String>, String, nil]
      # @param systems [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.mobile
      # @example
      #   FakeAgent::FakeAgent.mobile(browsers: "chrome")
      # @example
      #   FakeAgent::FakeAgent.mobile(browsers: %w[chrome firefox edge safari])
      # @example
      #   FakeAgent::FakeAgent.mobile(systems: "ios")
      # @example
      #   FakeAgent::FakeAgent.mobile(systems: %w[android ios])
      # @example
      #   FakeAgent::FakeAgent.mobile(browsers: %w[chrome firefox edge opera], systems: "android")
      def mobile(browsers: @browsers, systems: @systems)
        get_agent(browsers: Array(browsers), systems: Array(systems), platforms: %w[mobile])
      end

      # Generates a user agent string for tablet
      #
      # @param browsers [Array<String>, String, nil]
      # @param systems [Array<String>, String, nil]
      #
      # @return [String]
      #
      # @example
      #   FakeAgent::FakeAgent.tablet
      # @example
      #   FakeAgent::FakeAgent.tablet(browsers: "chrome")
      # @example
      #   FakeAgent::FakeAgent.tablet(browsers: %w[chrome firefox edge safari])
      # @example
      #   FakeAgent::FakeAgent.tablet(systems: "ios")
      # @example
      #   FakeAgent::FakeAgent.tablet(browsers: %w[chrome firefox edge safari], systems: "ios")
      def tablet(browsers: @browsers, systems: @systems)
        get_agent(browsers: Array(browsers), systems: Array(systems), platforms: %w[tablet])
      end

      private

      def get_agent(browsers: @browsers, systems: @systems, platforms: @platforms)
        data = @data.select do |x|
          browsers.include? x["browser"] and systems.include? x["system"] and platforms.include? x["platform"]
        end
        data = @data if data.length <= 0
        data[Random.rand(data.length)]["useragent"]
      end
    end
  end

  def self.version
    VERSION
  end
end
