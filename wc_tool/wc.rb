#!/usr/bin/env ruby
require 'optparse'

OUTPUT = []
OPTIONS = {}
puts ARGV
OptionParser.new do |opts|
  opts.banner = "Usage: wc.rb [options]"
  opts.on("-c", "--bytes", "print the byte counts") { OPTIONS[:bytes] = true }
  opts.on("-l", "--lines", "print the newline counts") { OPTIONS[:lines] = true }
  opts.on("-w", "--words", "print the word counts") { OPTIONS[:words] = true }
  opts.on("-m", "--chars", "print the character counts") { OPTIONS[:chars] = true }
end.parse!

FILENAME = ARGV.shift

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

if OPTIONS.empty?
  OPTIONS[:bytes] = OPTIONS[:lines] = OPTIONS[:words] = true
end

if OPTIONS[:lines]
  OUTPUT << "#{newline_counts}"
end

if OPTIONS[:words]
  OUTPUT << "#{words_count}"
end

if OPTIONS[:bytes]
  OUTPUT << "#{byte_counts}"
end

if OPTIONS[:chars]
  OUTPUT << "#{chars_count}"
end

OUTPUT << FILENAME

p OUTPUT.join(" ")
