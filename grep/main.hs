module Main( main ) where

import System( getArgs,getProgName )
import Grep


main :: IO ()
main = do {
           args <- getArgs;
	   prog <- getProgName;
           if ((length args) < 2) then
               do {
                   if ((length args) < 1) then
                       do {
                           putStr ("Warning: no arguments given\n");
                           putStr ("Try `"++prog++" --help' for more information.\n");
                           putStr ("Enter the string to use as a pattern :\n");
                           pattern <- getLine;   
                           putStr ("Enter the name of an input file : \n");
                           file <- getLine;   
                           s <- catch (readFile file) handler;
                           printout (grepin pattern (zip [1..] (lines s)));
                          }
                   else 
                       do {
                           if (((args!!0) == "-h") || ((args!!0) == "--help")) then
                               do
                                 {
                                  putStr ("Usage: "++ prog ++" PATTERN.. FILE..\n");
                                  putStr ("Implementation of `grep -n' written in haskell\n");
                                  putStr ("Example: "++ prog ++" 'hello' myfile\n");
                                  putStr ("\nWith no FILE, read standard input.\n");
                                  putStr ("\nReport bugs to <hrishikeshrt@cmi.ac.in>.\n");
                                 }                           
                           else
                               do {
                                   s <- catch (readFile "/dev/stdin") handler;
                                   printout (grepin (args!!0) (zip [1..] (lines s)));
                                  }
                          }
                  }
           else 
               do {
                   s <- catch (readFile (args!!1)) handler;
                   printout (grepin (args!!0) (zip [1..] (lines s)));
                  }
           }
