inputs = {
  "a"      => "odd",
  "aa"     => "even",
  "abab"   => "even",
  "caab"   => "odd",
  "baabc"  => "even",
  "aadcbb" => "neither"
}

inputs.each do |(str, expected)|
  puts "calculating string '#{str}'"
  h = Hash.new(0)

  str.each_char do |char|
    h[char] += 1
  end

  odd_count  = 0
  even_count = 0

  h.each do |letter, value|
    if value.even?
      even_count += 1
    else 
      odd_count += 1
    end
  end

  puts h.inspect

  result = if odd_count == even_count
    'neither'
  elsif odd_count > even_count
    'odd'
  else
    'even'
  end

  puts "For string '#{str}' expected #{expected}, got #{result}\n\n"
end
