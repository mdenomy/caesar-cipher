class CaesarCypher
  LOWER_A_ORD = "a".ord
  UPPER_A_ORD = "A".ord
  PATTERN = /[a-zA-Z]/

  def initialize(shift)
    @shift = shift
  end

  def encrypt(input)
    input.gsub(PATTERN) {|s| encrypt_char(s) }
  end

  def decrypt(input)
    input.gsub(PATTERN) {|s| decrypt_char(s) }
  end

  private

  def base_ordinal_val(char)
    if char.ord >= LOWER_A_ORD
      LOWER_A_ORD
    else
      UPPER_A_ORD
    end
  end

  def encrypt_char(char)
    base = base_ordinal_val(char)
    offset = (char.ord - base + @shift) % 26
    (base + offset).chr
  end

  def decrypt_char(char)
    base = base_ordinal_val(char)
    offset = (char.ord - base - @shift) % 26
    (base + offset).chr
  end
end