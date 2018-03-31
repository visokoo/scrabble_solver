gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative '../scrabble_solver'

class ScrabbleTest < Minitest::Test
  def test_return_right_tiles
    assert_equal ["hat", "ah", "ha", "th", "at", "a"], Scrabble::Tile.tiles('hat')
    assert_equal ["blah", "bah", "lh", "lab", "alb", "ha", "ah", "ab", "la", "al", "a"], Scrabble::Tile.tiles('blah')
  end

  def test_order_does_not_matter
    assert_equal ["hat", "ah", "ha", "th", "at", "a"], Scrabble::Tile.tiles('aht')
    assert_equal ["blah", "bah", "lh", "lab", "alb", "ha", "ah", "ab", "la", "al", "a"], Scrabble::Tile.tiles('lbah')
  end

  def test_case_insensitive
    assert_equal ["hat", "ah", "ha", "th", "at", "a"], Scrabble::Tile.tiles('hAt')
    assert_equal ["blah", "bah", "lh", "lab", "alb", "ha", "ah", "ab", "la", "al", "a"], Scrabble::Tile.tiles('lbAH')
  end

  def test_cannot_spell_anything
    assert_equal [], Scrabble::Tile.tiles('')
    assert_equal [], Scrabble::Tile.tiles('zzz')
  end
end