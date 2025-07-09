inputs = {
  "a"      => "odd",
  "aa"     => "even",
  "abab"   => "even",
  "caab"   => "odd",
  "baabc"  => "even",
  "aadcbb" => "neither"
}

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

  if result == inputs[word]
    puts "✓ '#{word}' is #{result.upcase}, as expected\n\n"
  else
    puts "× #{word} is #{result.upcase}, but should have been #{inputs[word].upcase}\n\n"
  end
end
