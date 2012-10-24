require 'set'
require 'color_text'

class NotValidDictionaryError < StandardError
end

class InvalidSeedError < StandardError
end

class Anagrams
  def initialize(dictionary)
    @dictionary = dictionary
    @read_words_from_dictionary = @dictionary.is_a?(Array) ?  @dictionary : read_words_from_dictionary
  end
  
  def find_words(seed)
    if seed.index(/\s/)
      raise InvalidSeedError
    else
      @seed = seed
      split_seed = split_words_to_letters(@seed)
      split_words = split_anagrams_to_letters(@read_words_from_dictionary)
      match_word = find_anagrams(split_seed, split_words)
      result = merge_letters_back_to_words(match_word)
      result = result.delete_if { |seed| seed == @seed }
      result
    end
  end

  private
  
  def read_words_from_dictionary
    words = []
    File.open(@dictionary, 'r') do |f|
      while line = f.gets
        if !line.chomp.index(/\s/) # Check if the words in dictionary are not phrases
          words << line.chomp
        else
          raise NotValidDictionaryError
        end
      end
    end
    words
  end

  def split_anagrams_to_letters(anagrams)
    split_words = anagrams.map do |anagram|
      split_words_to_letters(anagram)
    end
  end
  
  def split_words_to_letters(word)
    split_word = []
    word.length.times do |i|
      split_word << word.slice(i)
    end
    split_word
  end

  def find_anagrams(split_seed, split_words)
    find_this = Set.new(split_seed)
    split_words.select do |word|
      word if find_this == Set.new(word)
    end
  end

  def merge_letters_back_to_words(match_word)
    back_to_word = ""
    match_word.inject([]) do |result, word|
      word.length.times do |i|
        back_to_word += word[i]
      end
      result << back_to_word
      back_to_word = ""
      result
    end
  end
end