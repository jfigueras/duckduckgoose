class ItFirstOrder

  def order(data)
    _sort_with_it_first(data)
  end

#  private
#  attr_reader :data

  def _sort_with_it_first data

    it_id = data.map{ |player| player.name if player.is_a? It }.compact.first      
    size = data.size
    
   
    if it_id == 0
      playerstmp = data

    else
      
      if it_id == size
        playerstmp = [data[size], data[0,size-1]]
      else
        
        it_index = data.index { |x| x.is_a? It} 
        tmp1 = data[0, it_index]
        tmp2 = data[it_index, size-1]
        players = [ tmp2, tmp1 ].flatten
      end  
    end 
  end  

end  