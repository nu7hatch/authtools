require 'digest/sha2'
require 'authtools/common'

module Authtools
  module Password
    extend Common
    extend self
    
    # Generates a new salt and rehashes the password. Returns mixed hash.
    #
    # == Examples
    #   store = Authtools::Password.generate('mysecret') 
    #     # => "f7d8f299e342168b7a8b0aeece32e090c4acced13a6bd7f2b26fc
    #     # 88251f550943820d190df00a87d20b7bc00cee332c48f9c4953793837
    #     # 2a6c4fbcbe5d3944ccr1x6DlrfTf6OUrwl6ohoivxN2fAQiblav1sLyd9
    #     # z7PFaQgQH3XxTA0BuMAbFRmMM"
    #   
    def generate(password)
      salt = self.salt
      hash = self.hash(password, salt)
      store(hash, salt)
    end

    # Alias for generate method
    #
    def new(password)
      generate(password)
    end
  
    # Checks the password against the stored password.
    #
    # == Examples
    #   # In `store` is hash generated before (see `generate` method).
    #   Authtools::Password.check('mysecret', store) # => true
    #   Authtools::Password.check('fake', store)     # => false
    #  
    def check(password, store)
      hash = get_hash(store)
      salt = get_salt(store)
      self.hash(password, salt) == hash
    end
  
    # Generates a 128 character hash.
    #
    def hash(password, salt)
      Digest::SHA512.hexdigest("#{password}:#{salt}")
    end
  
    # Mixes the hash and salt together for storage.
    # 
    def store(hash, salt)
      hash + salt
    end
  
    # Gets the hash from a stored password.
    # 
    def get_hash(store)
      store[0..127]
    end
  
    # Gets the salt from a stored password.
    #
    def get_salt(store)
      store[128..192]
    end
  end
end
