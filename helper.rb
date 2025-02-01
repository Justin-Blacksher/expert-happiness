def length_in_hex(string)
  length = string.length + 1
  hex_length = "0" + length.to_s(16) + "h"
  hex_length
end

# Example usage
puts length_in_hex("hello")  # Output will be "06h"
puts length_in_hex("world!") # Output will be "07h"
