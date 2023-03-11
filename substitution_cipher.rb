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
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
    end
  end
end
