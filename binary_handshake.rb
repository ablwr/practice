class SecretHandshake

  def initialize(num)
    @num = num
  end

  def commands
    handshake = []
    secret = @num.split("").reverse 
    handshake << "wink" if secret[0] == "1"  
    handshake << "double blink" if secret[1] == "1" 
    handshake << "close your eyes" if secret[2] == "1"  
    handshake << "jump" if secret[3] == "1"
    handshake.reverse! if secret[4] == "1"
    handshake
  end


end
