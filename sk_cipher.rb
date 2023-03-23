# frozen_string_literal: true

require 'rbnacl'
require 'base64'

# module for implementing Modern Symmetric Cipher
module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string
    @key = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
    box = RbNaCl::SimpleBox.from_secret_key(key)
    encrypted = box.encrypt(document.to_s)
    Base64.strict_encode64(encrypted)
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    decoded = Base64.strict_decode64(encrypted_cc)
    box = RbNaCl::SimpleBox.from_secret_key(key)
    box.decrypt(decoded)
  end
end
