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
      def random(browsers: @browsers, systems: @systems, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: Array(systems), platforms: Array(platforms))
      end

      def chrome(systems: @systems, platforms: @platforms)
        get_agent(browsers: %w[chrome], systems: Array(systems), platforms: Array(platforms))
      end

      def safari(systems: @systems, platforms: @platforms)
        get_agent(browsers: %w[safari], systems: Array(systems), platforms: Array(platforms))
      end

      def firefox(systems: @systems, platforms: @platforms)
        get_agent(browsers: %w[firefox], systems: Array(systems), platforms: Array(platforms))
      end

      def edge(systems: @systems, platforms: @platforms)
        get_agent(browsers: %w[edge], systems: Array(systems), platforms: Array(platforms))
      end

      def opera(systems: @systems, platforms: @platforms)
        get_agent(browsers: %w[opera], systems: Array(systems), platforms: Array(platforms))
      end

      def windows(browsers: @browsers, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: %w[windows], platforms: Array(platforms))
      end

      def macos(browsers: @browsers, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: %w[macos], platforms: Array(platforms))
      end

      def linux(browsers: @browsers, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: %w[linux], platforms: Array(platforms))
      end

      def android(browsers: @browsers, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: %w[android], platforms: Array(platforms))
      end

      def ios(browsers: @browsers, platforms: @platforms)
        get_agent(browsers: Array(browsers), systems: %w[ios], platforms: Array(platforms))
      end

      def desktop(browsers: @browsers, systems: @systems)
        get_agent(browsers: Array(browsers), systems: Array(systems), platforms: %w[desktop])
      end

      def mobile(browsers: @browsers, systems: @systems)
        get_agent(browsers: Array(browsers), systems: Array(systems), platforms: %w[mobile])
      end

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
