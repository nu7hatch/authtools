require 'digest/sha2'
require 'digest/md5'
require 'authtools/common'

module Authtools
  module Token
    extend Common
    extend self
      
    TINY   = 128
    SHORT  = 256
    MEDIUM = 384
    LONG   = 512
    
    # Generates new token with specified size.
    #
    def generate(size=SHORT)
      size = const_get(size.to_s.upcase) if [:tiny, :short, :medium, :long].include?(size)
      if size > 128
        hash = Digest::SHA2.new(size)
        hash << self.salt
      else
        hash = Digest::MD5.hexdigest(self.salt)
      end
      hash.to_s
    end

    # Alias for generate method.
    #
    def new(size=SHORT)
      generate(size)
    end
    
    %w{tiny short medium long}.each do |label|
      module_eval do 
        define_method(label) { generate(label.to_sym) }
      end
    end
  end
end
