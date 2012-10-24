require 'test/unit'
require './anagrams'

class AnagramsTest < Test::Unit::TestCase
  
  def call_anagram(word, dictionary)
    anagram = Anagrams.new(dictionary)
    anagram.find_words(word)
  end
  
  def test_file_empty
    expected_result = call_anagram('cat', 'empty_file.txt')
    assert_equal [], expected_result
  end
  
  def test_dictionary_format
    assert_raise NotValidDictionaryError do
      call_anagram('cat', 'different_format.txt')
    end
  end

  def test_initialize_dictionary_with_words
    expected_result = call_anagram('rat', ['art', 'tar', 'tan', 'not'])
    assert_equal ['art', 'tar'], expected_result
  end
  
  def test_seed_validity
    assert_raise InvalidSeedError do
      call_anagram('hello world', 'dictionary.txt')
    end
  end
  
  def test_seed_has_no_anagrams
    expected_result = call_anagram('hello', 'dictionary.txt')
    assert_equal 0, expected_result.size
  end
  
  def test_seed_has_single_anagram
    expected_result = call_anagram('cat', 'dictionary.txt')
    assert_equal 1, expected_result.size
  end
  
  def test_seed_has_multiple_anagrams
    expected_result = call_anagram('meat', 'dictionary.txt')
    assert_equal ['mate', 'team'], expected_result
  end
end