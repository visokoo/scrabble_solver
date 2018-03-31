gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative '../score'

class ScrabbleScore < Minitest::Test
  def test_simple_score
    assert_equal 5, Scrabble::Scoring.score('dog')
    assert_equal 7, Scrabble::Scoring.score('code')
    assert_equal 39, Scrabble::Scoring.score('antidisestablishmenatarianism')
  end

  def test_case_insensitive_scoring
    assert_equal 5, Scrabble::Scoring.score('dOg')
    assert_equal 5, Scrabble::Scoring.score('DOG')
  end

  def test_assert_nil_for_bad_string
    assert_nil nil, Scrabble::Scoring.score('a3z')
    assert_nil nil, Scrabble::Scoring.score(" ")
    assert_nil nil, Scrabble::Scoring.score('#$%^')
  end
end