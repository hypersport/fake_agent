# frozen_string_literal: true

require "test_helper"

class TestFakeAgent < Minitest::Test
  def setup
    agents = File.read(File.join(__dir__, "../lib", "browsers.json"))
    @data = JSON.parse(agents)
  end

  def test_random
    agent = FakeAgent::FakeAgent.random
    refute_empty @data.select { |x| x["useragent"] == agent }
  end

  def test_chrome
    agent = FakeAgent::FakeAgent.chrome
    refute_empty @data.select { |x| x["useragent"] == agent and x["browser"] == "chrome" }
  end

  def test_safari
    agent = FakeAgent::FakeAgent.safari
    refute_empty @data.select { |x| x["useragent"] == agent and x["browser"] == "safari" }
  end

  def test_firefox
    agent = FakeAgent::FakeAgent.firefox
    refute_empty @data.select { |x| x["useragent"] == agent and x["browser"] == "firefox" }
  end

  def test_edge
    agent = FakeAgent::FakeAgent.edge
    refute_empty @data.select { |x| x["useragent"] == agent and x["browser"] == "edge" }
  end

  def test_duckduckgo
    agent = FakeAgent::FakeAgent.duckduckgo
    refute_empty @data.select { |x| x["useragent"] == agent and x["browser"].downcase.include? "duckduckgo" }
  end

  def test_windows
    agent = FakeAgent::FakeAgent.windows
    refute_empty @data.select { |x| x["useragent"] == agent and x["os"] == "win10" }
  end

  def test_macos
    agent = FakeAgent::FakeAgent.macos
    refute_empty @data.select { |x| x["useragent"] == agent and x["os"] == "macos" }
  end

  def test_linux
    agent = FakeAgent::FakeAgent.linux
    refute_empty @data.select { |x| x["useragent"] == agent and x["os"] == "linux" }
  end

  def test_android
    agent = FakeAgent::FakeAgent.android
    refute_empty @data.select { |x| x["useragent"] == agent and x["os"] == "android" }
  end

  def test_ios
    agent = FakeAgent::FakeAgent.ios
    refute_empty @data.select { |x| x["useragent"] == agent and x["os"] == "ios" }
  end

  def test_pc
    agent = FakeAgent::FakeAgent.pc
    refute_empty @data.select { |x| x["useragent"] == agent and x["type"] == "pc" }
  end

  def test_mobile
    agent = FakeAgent::FakeAgent.mobile
    refute_empty @data.select { |x| x["useragent"] == agent and x["type"] == "mobile" }
  end

  def test_tablet
    agent = FakeAgent::FakeAgent.tablet
    refute_empty @data.select { |x| x["useragent"] == agent and x["type"] == "tablet" }
  end
end
