# Read the file
file_content = File.read('the-book.txt')

puts "Original file size: #{file_content.length} characters"
puts "First 200 characters of original:"
puts file_content[0, 200]

# Convert to lowercase and remove non a-z characters
processed = file_content
  .downcase
  .gsub(/[^a-z]/, '')

puts "\nProcessed file size: #{processed.length} characters"
puts "First 200 characters of processed text:"
puts processed[0, 200]

# Show the difference
puts "\nReduction: #{file_content.length - processed.length} characters removed"

# Optionally, write the processed text to a new file
File.write('the-book-processed.txt', processed)
puts "Processed text saved to 'the-book-processed.txt'"
