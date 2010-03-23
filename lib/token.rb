require 'digest/sha2'
require 'authtools/common'

module Authtools
  module Token
    SHORT = 256
    MEDIUM = 384
    LONG = 512
    
    # Generates new token with specified size.
    #
    def self.generate(size=SHORT)
      hash = Digest::SHA2.new(size)
      hash << salt
      hash.to_s
    end
    alias_method :new, :generate
    
    # Shortcut for generate 256 bit token.
    #
    def self.short
      self.generate(SHORT)
    end
    
    # Shortcut for generate 384 bit token.
    #
    def self.medium
      self.generate(MEDIUM)
    end
    
    # Shortcut for generate 512 bit token.
    #
    def self.long
      self.generate(LONG)
    end
    
    protected
    
    include Authtools::Common
  end
end