require "zlib"

module PlantUmlCompressor
  CHARS = ("0".."9").to_a + ("A".."Z").to_a + ("a".."z").to_a + ["-", "_"]

  def self.compress(text)
    compressed = Zlib::Deflate.deflate(text, Zlib::BEST_COMPRESSION)
    compressed.chars.each_slice(3).map do |chars|
      append3bytes(chars[0].ord, chars[1]&.ord.to_i, chars[2]&.ord.to_i)
    end.join
  end

  private
  def self.append3bytes(b1, b2, b3)
    [
      b1 >> 2,
      ((b1 & 0x3) << 4) | (b2 >> 4),
      ((b2 & 0xF) << 2) | (b3 >> 6),
      b3 & 0x3F,
    ].map { |c| CHARS[c & 0x3F] || "?" }.join
  end
end

text       = readlines.join("")
compressed = PlantUmlCompressor.compress(text)
puts url = "![alt](https://www.plantuml.com/plantuml/png/#{compressed})"
