class RPN

  def initialize
    @stack = []
  end

  def is_an_operator?(token)
    ["-", "/", "*", "+"].include?(token)
  end

  def calculate(token)
    if @stack.size > 1
      symbols = @stack.pop(2)
      @stack.push(symbols[0].send(token, symbols[1])) 
    else 
      warn "Please enter more than one number first."
    end
  end

  def is_a_number?(token)
      token.match(/\d+(\.\d+)?/)
  end

  def add_to_array(token)
    if token != "0" && token != "-0"
      @stack << token.to_f
    else
      puts "please enter a number other than 0"
    end
  end

  def is_quit_command?(token)
    ["q", "quit", "exit"].include?(token)
  end

  def evaluation_exists?
    @stack.last != nil
  end

  def evaluate
    loop do
      @input = gets.chomp.split
      @input.each do |token|
      if is_an_operator?(token)
        calculate(token)
      elsif is_a_number?(token)
        add_to_array(token)
      elsif is_quit_command?(token)
        puts "Quitting"
        exit
      else
        warn "Please enter a number or valid operation."
      end
      end
      if evaluation_exists?
        puts @stack.last
      end
    end
  end
end

RPN1 = RPN.new
RPN1.evaluate