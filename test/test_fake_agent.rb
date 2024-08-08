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

  def test_opera
    agent = FakeAgent::FakeAgent.opera
    refute_empty @data.select { |x| x["useragent"] == agent and x["browser"] == "opera" }
  end

  def test_windows
    agent = FakeAgent::FakeAgent.windows
    refute_empty @data.select { |x| x["useragent"] == agent and x["system"] == "windows" }
  end

  def test_macos
    agent = FakeAgent::FakeAgent.macos
    refute_empty @data.select { |x| x["useragent"] == agent and x["system"] == "macos" }
  end

  def test_linux
    agent = FakeAgent::FakeAgent.linux
    refute_empty @data.select { |x| x["useragent"] == agent and x["system"] == "linux" }
  end

  def test_android
    agent = FakeAgent::FakeAgent.android
    refute_empty @data.select { |x| x["useragent"] == agent and x["system"] == "android" }
  end

  def test_ios
    agent = FakeAgent::FakeAgent.ios
    refute_empty @data.select { |x| x["useragent"] == agent and x["system"] == "ios" }
  end

  def test_desktop
    agent = FakeAgent::FakeAgent.desktop
    refute_empty @data.select { |x| x["useragent"] == agent and x["platform"] == "desktop" }
  end

  def test_mobile
    agent = FakeAgent::FakeAgent.mobile
    refute_empty @data.select { |x| x["useragent"] == agent and x["platform"] == "mobile" }
  end

  def test_tablet
    agent = FakeAgent::FakeAgent.tablet
    refute_empty @data.select { |x| x["useragent"] == agent and x["platform"] == "tablet" }
  end
end
