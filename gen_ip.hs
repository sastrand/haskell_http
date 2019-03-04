import System.Random (randomRIO)
import Control.Monad (replicateM)
import Data.List (intercalate, intersperse)
import System.Environment (getArgs)

createOctets :: IO [Int]
createOctets = replicateM 4 $ randomRIO (0,255)

createOctetStr :: IO [String]
createOctetStr = fmap (map show) $ createOctets

createIP :: IO [Char]
createIP = fmap (intercalate ".") createOctetStr

createIPs n = fmap unlines $ replicateM n createIP

main = do
       argv   <- getArgs
       rawrIO <- createIPs $ 2^(read $ head argv)
       writeFile "ips.txt" rawrIO

{------------------------------------------------------------------------------
 - Sources

 - creating a list of random numbers
   https://stackoverflow.com/questions/30740366/list-with-random-numbers-in-haskell
------------------------------------------------------------------------------}
