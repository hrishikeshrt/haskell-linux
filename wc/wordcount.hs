{---------------------------------------- Word Count ------------------------------------------}                                         
-- Counts & Returns (Lines, Words, Characters) by taking standard input (keyboard)

-- To show the answer, we can very well use wordcount >>= print, still
-- Otherwise I have written "showcount" to show result.
{----------------------------------------------------------------------------------------------}

showcount = wordcount >>= print

wordcount :: IO (Int, Int, Int)
wordcount = do{

              x<-getChar;
              if (x=='\n') then
                  return (0,0,0)
              else
                  auxwordcount x (0,0,1);
               }

----------------------------------------------------------------------------------------------
-- Takes 1 Character in argument, Compares it with next character from Input,
-- Imposes conditions of end of word, end of line, end of input etc.
-- For example ' ' followed by c (/=' ') && (/='\n') indicates "number of words +1"
----------------------------------------------------------------------------------------------

auxwordcount :: Char -> (Int,Int,Int) -> IO (Int,Int,Int)
auxwordcount m (x,y,z) = do{
                          c <- getChar;
                          if (m=='\n') then

                             if (c=='\n') then
                                return (x,y,z)
                             else
                                 if (c==' ') then
                                  auxwordcount c (x,y,z+1)
                                 else
                                 auxwordcount c (x,y,z+1)
                          else
                              if (m==' ') then
                                  if (c==' ') then
                                     auxwordcount c (x,y,z+1)
                                  else
                                      if (c=='\n') then
                                         auxwordcount c (x+1,y,z+1)
                                      else 
                                         auxwordcount c (x,y,z+1)
                              else 
                                  if (c=='\n') then
                                      auxwordcount c (x+1,y+1,z+1)
                                  else
                                      if (c==' ') then
                                          auxwordcount c (x,y+1,z+1)
                                      else
                                          auxwordcount c (x,y,z+1);
                                 
                            }

{--------------------------------------------End-----------------------------------------------}

