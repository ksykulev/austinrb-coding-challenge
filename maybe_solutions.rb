require 'minitest/autorun'

class PalindromeCheckerTest < Minitest::Test
  def test_empty_string_is_neither
    assert_equal(EvenOddCheck.new("").iterate_over_string(""), :neither)
  end

  def test_empty_space_doesn_not_count
    assert_equal(EvenOddCheck.new("").iterate_over_string(" "), :neither)
  end

  def test_casing
    assert_equal(EvenOddCheck.new("").iterate_over_string("caAbB"), :even)
  end

  def test_single_character_is_odd
    assert_equal(EvenOddCheck.new("").iterate_over_string("a"), :odd)
  end

  def test_double_character_is_even
    assert_equal(EvenOddCheck.new("").iterate_over_string("aa"), :even)
  end

  def test_double_double_is_even
    assert_equal(EvenOddCheck.new("").iterate_over_string("abab"), :even)
  end

  def test_single_double_character_and_single_characters_is_odd
    assert_equal(EvenOddCheck.new("").iterate_over_string("caab"), :odd)
  end

  def test_single_double_character_and_single_characters_is_odd
    assert_equal(EvenOddCheck.new("").iterate_over_string("baabc"), :even)
  end

  def test_neither_is_true_for_slit_decision
    assert_equal(EvenOddCheck.new("").iterate_over_string("aadcbb"), :neither)
  end

  def test_reads_original_regular_text
    assert_equal(EvenOddCheck.new("/Users/stephenford/Development/aust_test/austinrb-coding-challenge/the-book-original.txt").iterate_over_file, :odd)
  end

  def test_reads_original_other_text
    assert_equal(EvenOddCheck.new("/Users/stephenford/Development/aust_test/austinrb-coding-challenge/the-book.txt").iterate_over_file, :odd)
  end
end

class EvenOddCheck
  def initialize(file_path)
    @file_path = file_path
    @character_counts = {}
  end

  def iterate_over_string(string, determine: true)
    string.downcase.delete(" ").gsub(/[^a-zA-Z]/, '').each_char do |char|
      @character_counts[char] ||= 0
      @character_counts[char] += 1
    end
    determine_oddity if determine
  end

  def iterate_over_file(chunk_size: 1000)
    File.open(@file_path, "r").each_line do |line|
      line.scan(/.{1,#{chunk_size}}/m).each { |chunk| iterate_over_string(chunk, determine: false) }
    end
    determine_oddity
  end

  def determine_oddity
    even = @character_counts.select {|key, value| value.even? }.size
    odd = @character_counts.select {|key, value| value.odd? }.size
    if odd > even
      :odd
    elsif even > odd
      :even
    else
      :neither
    end
  end
end
