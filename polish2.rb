class RPN

  def initialize
    @evaluation = []
    @symbols = []
  end

  def is_an_operator?(a)
    ["-", "/", "*", "+"].include?(a)
  end

  def calculate(a)
    if @evaluation.size > 1
      symbols = @evaluation.pop(2)
      @evaluation.push(symbols[0].send(a, symbols[1])) 
    else 
      puts "Please enter more than one number first."
    end
  end

  def is_a_number?(a)
    a.match(/[0-9]/)
  end

  def add_to_array(a)
    @evaluation << a.to_f
  end

  def is_quit_command?(a)
    ["q", "quit", "exit"].include?(a)
  end

  def is_a_character?(a)
    a.match(/[a-zA-Z]/)
  end

  def evaluation_exists?
    @evaluation.last != nil
  end

  def evaluate
    loop {
      input = gets.chomp.split 
      input.each do |a|
      if is_an_operator?(a)
        calculate(a)
      elsif is_a_number?(a)
        add_to_array(a)
      elsif is_quit_command?(a)
        puts "Quitting"
        exit
      elsif is_a_character?(a)
        puts "Please enter a number or valid operation."
      end
      end
      if evaluation_exists?
        puts @evaluation.last
      end
    }
  end
end

RPN1 = RPN.new
RPN1.evaluate