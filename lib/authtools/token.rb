require 'digest/sha2'
require 'authtools/common'

module Authtools
  module Token
    extend self
      
    SHORT = 256
    MEDIUM = 384
    LONG = 512
    
    # Generates new token with specified size.
    #
    def generate(size=SHORT)
      hash = Digest::SHA2.new(size)
      hash << Authtools::Common.salt
      hash.to_s
    end

    # Alias for generate method.
    #
    def new(size=SHORT)
      generate(size)
    end
    
    # Shortcut for generate 256 bit token.
    #
    def short
      generate(SHORT)
    end
    
    # Shortcut for generate 384 bit token.
    #
    def medium
      generate(MEDIUM)
    end
    
    # Shortcut for generate 512 bit token.
    #
    def long
      generate(LONG)
    end
  end
end
