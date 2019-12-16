function s_track_num = stringifyNum(i)
  
if (floor(i/10) == 0)
    s_track_num = strcat('0000', int2str(i));
  elseif (floor(i/100) == 0)
    s_track_num = strcat('000', int2str(i));
  elseif (floor(i/1000) == 0)
    s_track_num = strcat('00', int2str(i));
  elseif (floor(i/10000) == 0)
    s_track_num = strcat('0', int2str(i));
  elseif (floor(i/100000) == 0)
    s_track_num = int2str(i);  
  end    
  
  
end