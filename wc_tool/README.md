# Challenge

This challenge is to build your own version of the Unix command line tool [wc](https://linux.die.net/man/1/wc)!

The Unix command line tools are a great metaphor for good software engineering and they follow the Unix Philosophies of:

- Writing simple parts connected by clean interfaces - each tool does just one thing and provides a simple CLI that handles text input from either files or file streams.
- Design programs to be connected to other programs - each tool can be easily connected to other tools to create incredibly powerful compositions.

Click the original link for detailed steps and additional references!

> [challenge-wc](https://codingchallenges.fyi/challenges/challenge-wc)

## Steps

- Step 1 ✅
- Step 2 ✅
- Step 3 ✅
- Step 4 ✅
- Step 5 ✅
- Step final ✅

## Usage

```ruby
$ ./wc.rb --help
Usage: wc.rb [options]
    -c, --bytes                      print the byte counts
    -l, --lines                      print the newline counts
    -w, --words                      print the word counts
    -m, --chars                      print the character counts

$ ./wc.rb test.txt
"7145 58164 342190 test.txt"

$ cat test.txt | ./wc.rb
"7145 58164 342190"
```

## Ruby

```sh
$ ruby --version
ruby 3.4.2 (2025-02-15 revision d2930f8e7a) +PRISM [x86_64-linux]
```
