#!/usr/bin/env ruby
require_relative 'score'

module Scrabble
  class Tile
    @dict = File.readlines("dict.txt").map { |line| line.chomp }

    def self.tiles(input)
      words_to_keep = []
      @dict.each do |word|
        next if word == ""
        input_array = input.downcase.split("")
        letters = word.split("")
        letter_not_in_input = false
        # run through each dict word by letter and removing 
        # from input_array if it exists, if it does not,
        # break from loop and start a new word
        letters.each do |letter|
          if input_array.include?(letter)
            index = input_array.index(letter)
            input_array.delete_at(index)
          else
            letter_not_in_input = true
            break
          end
        end
        # only add word to this array if all of 
        # its letters are in input
        words_to_keep << word if letter_not_in_input == false
      end
      words_to_keep.sort_by { |word| 0 - Scrabble::Scoring.score(word) }
    end
  end
end

if ARGV.empty?
  puts "Usage: Please provide an arg"
  exit
else
  input = ARGV[0]
end
puts Scrabble::Tile.tiles(input)