module Colorea
#define RED   "\x1B[31m"
#define GRN   "\x1B[32m"
#define YEL   "\x1B[33m"
#define BLU   "\x1B[34m"
#define MAG   "\x1B[35m"
#define CYN   "\x1B[36m"
#define WHT   "\x1B[37m"
#define RESET "\x1B[0m"

  colors = {red: "x1B[31m", green: "x1B[32m", yel:"x1B[31m", blue: "x1B[31m" }

  
  def random_color
    color = [31, 32, 33, 35, 36].sample
    printf "\033[#{color}m"
  end 

  def red_color
    printf "\x1B[31m"
  end 
  def green_color 
    printf "\x1B[32m"
  end 

  def reset_color
    printf "\e[m"
  end   

end