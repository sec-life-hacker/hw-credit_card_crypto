# frozen_string_literal: true

# module for implementing double transposition cipher
module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    matrix = gen_matrix(document)
    matrix.shuffle(random: Random.new(key)).map do |s|
      s.shuffle(random: Random.new(key))
    end.join.to_s
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
  end

  def self.gen_matrix(document)
    document = document.to_s
    matrix_size = Math.sqrt(document.size).ceil
    (matrix_size**2 - document.size).times { document << '#' }
    document
      .chars
      .each_slice(matrix_size)
      .to_a
  end

  def self.randomize(matrix, key); end
end
