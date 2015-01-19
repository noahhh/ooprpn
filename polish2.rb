class RPN
  def is_operator?(a)
    ["-", "/", "*", "+"].include?(a)
  end

  def is_number?(a)
    /\d/
  end

  def is_quit_command?(a)
    ["q", "quit", "exit"].include?(a)
  end

  def is_character?(a)
    /[a-zA-Z]/
  end

  def evaluation
    evaluation = []
    until evaluation.include?('q')
      symbols = []
      input = gets.chomp.split 
      input.each do |a|
      if is_operator?(a)
        if evaluation.size > 1
          symbols = evaluation.pop(2)
          evaluation.push(symbols[0].send(a, symbols[1])) 
        else 
          puts "Please enter more than one number first."
        end
      elsif is_number?(a)
        evaluation << a.to_f
      elsif is_quit_command?(a)
        puts "Quitting"
        exit
      elsif is_character?(a)
        puts "Please enter a number or valid operation."
        end
      end
     puts evaluation.last
    end
  end
end
RPN1 = RPN.new
RPN1.evaluation