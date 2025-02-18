#!/usr/bin/env ruby
require 'optparse'

OUTPUT = []
OPTIONS = {}

def initialize_options!
  OptionParser.new do |opts|
    opts.banner = "Usage: wc.rb [options]"
    opts.on("-c", "--bytes", "print the byte counts") { OPTIONS[:bytes] = true }
    opts.on("-l", "--lines", "print the newline counts") { OPTIONS[:lines] = true }
    opts.on("-w", "--words", "print the word counts") { OPTIONS[:words] = true }
    opts.on("-m", "--chars", "print the character counts") { OPTIONS[:chars] = true }
  end.parse!
end

def set_defaults!
  OPTIONS[:bytes] = OPTIONS[:lines] = OPTIONS[:words] = true if OPTIONS.empty?
end

def append_output(key, output)
  OUTPUT << output if OPTIONS[key]
end

def byte_counts
  File.read(FILENAME, mode: "rb").bytesize
end

def newline_counts
  File.readlines(FILENAME).size
end

def words_count
  File.read(FILENAME).split(" ").size
end

def chars_count
  File.read(FILENAME).chars.size
end

initialize_options!
set_defaults!

FILENAME = ARGV.shift

append_output(:lines, newline_counts)
append_output(:words, words_count)
append_output(:bytes, byte_counts)
append_output(:chars, chars_count)

OUTPUT << FILENAME
p OUTPUT.join(" ")
