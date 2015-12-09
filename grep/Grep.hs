module Grep where
import IO

printout :: [(Int,String)] -> IO ()
printout [] = return ()
printout (y:ys) = do
  putStr ((show (fst y)) ++":"++(snd y)++"\n");
  printout ys;
                   
grepin::String->[(Int,String)]->[(Int,String)]
grepin x [] = []
grepin x (y:ys)
    | (isSubStr x (snd y)) = (y:(grepin x ys))
    | otherwise = grepin x ys

isSubStr :: String -> String -> Bool
isSubStr x "" = False
isSubStr x (y:ys)
             | (length x > length (y:ys)) = False
             | otherwise = ((x == (take (length x) (y:ys))) || (isSubStr x ys))

handler :: IOError -> IO String
handler e 
    | isDoesNotExistError e = error ("Input file does not exist")
    | otherwise = ioError e
