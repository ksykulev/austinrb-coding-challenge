inputs = {
  "a"      => "odd",
  "aa"     => "even",
  "abab"   => "even",
  "caab"   => "odd",
  "baabc"  => "even",
  "aadcbb" => "neither"
}

book_path = File.expand_path('../../the-book.txt', __dir__)

inputs[File.read(book_path)] = "odd"

results = {}

inputs.keys.each do |word|
  letters = {}
  evens   = 0
  odds    = 0

  word.chars.each do |letter|
    letters[letter] ||= 0
    letters[letter] += 1
  end

  letters.each do |_k, total|
    if total.even?
      evens += 1
    else
      odds += 1
    end
  end

  result = if evens > odds
    'even'
  elsif odds > evens
    'odd'
  else
    'neither'
  end

  title = word[0..15]
  title += '...' if word.length > 16

  if result == inputs[word]
    puts "✓ '#{title}' is #{result.upcase}, as expected\n\n"
  else
    puts "× #{title} is #{result.upcase}, but should have been #{inputs[word].upcase}\n\n"
  end
end
