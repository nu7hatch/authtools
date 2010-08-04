module Authtools
  module Common
    # Generates a psuedo-random 64 character string.
    #
    def salt
      salt = ""
      64.times { salt << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
      salt
    end
  end
end
