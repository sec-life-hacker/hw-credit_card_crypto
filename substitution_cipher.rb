# frozen_string_literal: true

# module for implementing substitution cipher encryption
module SubstitutionCipher
  # module for implementing caesar cipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      # 1. convert document into an array of ascii code
      # 2. shift document by adding $key to every ascii value
      # 3. convert ascii code back into letters
      document.to_s.chars
              .map(&:ord)
              .map { |c| c + key }
              .map(&:chr).join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      # 1. convert document into an array of ascii code
      # 2. shift document by reducing $key to every ascii value
      # 3. convert ascii code back into letters
      document.to_s.chars
              .map(&:ord)
              .map { |c| c - key }
              .map(&:chr).join
    end
  end

  # module for implementing permutation cipher
  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      # 1. convert document into an array of ascii code
      # 2. substitute values according to the position in the lookup_table (position => value)
      # 3. convert ascii code back into letters
      lookup_table = (0..127).to_a.shuffle!(random: Random.new(key))
      document.to_s.chars
              .map(&:ord)
              .map { |c| lookup_table.at(c) }
              .map(&:chr).join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      # 1. convert document into an array of ascii code
      # 2. substitute values according to the value in the lookup_table (value => position)
      # 3. convert ascii code back into letters
      lookup_table = (0..127).to_a.shuffle!(random: Random.new(key))
      document.to_s.chars
              .map(&:ord)
              .map { |c| lookup_table.index(c) }
              .map(&:chr).join
    end
  end
end
