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
  len = str.length
  i, j = 0, len-1

  loop do
    break if (len % 2 == 0 && i == j+1)

    h[str[i].chr] += 1

    break if len == 1

    break if (len % 2 == 0 && i == j+1) || (len % 2 != 0 && i == j)

    h[str[j].chr] += 1
    i += 1
    j -= 1
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
