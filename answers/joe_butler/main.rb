inputs = {
  "a" => "odd",
  "aa" => "even",
  "abab" => "even",
  "caab" => "odd",
  "baabc" => "even",
  "aadcbb" => "neither"
}

# TODO: accept input from stdin

class StringClassifier
  def initialize()
    @char_counts = Hash.new { |hash, key| hash[key] = 0 }
  end

  def load_buffer(buffer)
    buffer.each_grapheme_cluster do |cluster|
      # supports multibyte chars
      @char_counts[cluster] += 1
    end
  end

  def classify
    odds, evens = @char_counts.values.partition(&:odd?)
    if odds.size > evens.size
      "odd"
    elsif odds.size < evens.size
      "even"
    else
      "neither"
    end
  end
end

def classify_string(content)
  classifier = StringClassifier.new
  classifier.load_buffer(content)
  classifier.classify
end

inputs.each do |key, value|
  puts "#{key} is classified as #{classify_string(key)}"
end

the_book_path = File.expand_path('../../the-book.txt', __dir__)
# the_book = File.read(the_book_path) # Memory delta: 1424.0 KB
# puts "the-book.txt is #{classify_string(the_book)}"

# A 1kb buffer will have
#  Memory delta: 416.0 KB
File.open(the_book_path, "rb") do |file|
  classifier = StringClassifier.new
  while !file.eof?
    classifier.load_buffer(file.read(1024)) # Read 1024 bytes into buffer
  end
  puts "the-book.txt is #{classifier.classify}"
end
