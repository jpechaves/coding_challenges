#!/usr/bin/env ruby
require 'test/unit'

class WCTest < Test::Unit::TestCase
  TEST_FILE = "test.txt"
  WC_SCRIPT = "./wc.rb"

  def setup
    assert File.exist?(TEST_FILE), "Sample #{TEST_FILE} not found"
    assert File.exist?(WC_SCRIPT), "Script #{WC_SCRIPT} not found"
    assert File.executable?(WC_SCRIPT), "Script #{WC_SCRIPT} is not executable"
  end

  def test_default_behavior
    output = `#{WC_SCRIPT} #{TEST_FILE}`
    expected_output = "7145 58164 342190 test.txt\n"
    assert_equal expected_output, output
  end

  def test_byte_count
    output = `#{WC_SCRIPT} -c #{TEST_FILE}`
    expected_output = "342190 test.txt\n"
    assert_equal expected_output, output
  end

  def test_line_count
    output = `#{WC_SCRIPT} -l #{TEST_FILE}`
    expected_output = "7145 test.txt\n"
    assert_equal expected_output, output
  end

  def test_word_count
    output = `#{WC_SCRIPT} -w #{TEST_FILE}`
    expected_output = "58164 test.txt\n"
    assert_equal expected_output, output
  end

  def test_char_count
    output = `#{WC_SCRIPT} -m #{TEST_FILE}`
    expected_output = "339292 test.txt\n"
    assert_equal expected_output, output
  end

  def test_combined_options
    output = `#{WC_SCRIPT} -clwm #{TEST_FILE}`
    expected_output = "7145 58164 342190 339292 test.txt\n"
    assert_equal expected_output, output
  end

  def test_default_behavior_with_pipe
    output = `cat #{TEST_FILE} | #{WC_SCRIPT}`
    expected_output = "7145 58164 342190\n"
    assert_equal expected_output, output
  end

  def test_byte_count_with_pipe
    output = `cat #{TEST_FILE} | #{WC_SCRIPT} -c`
    expected_output = "342190\n"
    assert_equal expected_output, output
  end

  def test_line_count_with_pipe
    output = `cat #{TEST_FILE} | #{WC_SCRIPT} -l`
    expected_output = "7145\n"
    assert_equal expected_output, output
  end

  def test_word_count_with_pipe
    output = `cat #{TEST_FILE} | #{WC_SCRIPT} -w`
    expected_output = "58164\n"
    assert_equal expected_output, output
  end

  def test_char_count_with_pipe
    output = `cat #{TEST_FILE} | #{WC_SCRIPT} -m`
    expected_output = "339292\n"
    assert_equal expected_output, output
  end

  def test_combined_options_with_pipe
    output = `cat #{TEST_FILE} | #{WC_SCRIPT} -clwm`
    expected_output = "7145 58164 342190 339292\n"
    assert_equal expected_output, output
  end
end
