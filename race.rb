class Race


attr_reader :it, :goose

  def initialize( it: it, goose: goose)
    @it = it
    @goose = goose
    
  end  

  def call
    _race(it, goose)
  end  

private
attr_reader :it, :goose

  def _race it, goose
    if rand(10000)/1000>5 
      it = it
      goose = goose
      goose_tag_it = true 
      puts "*** The goose tag the it ***", ""
    else 
      it = it
      goose = goose
      goose_tag_it = false
      puts "*** The goose did not tag the it ***", ""
    end
    
    { it: it, goose: goose, goose_tag_it: goose_tag_it }
  end  

end
