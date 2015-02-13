{-# LANGUAGE OverloadedStrings #-}
import HayooBot.Query
import qualified Data.ByteString.Lazy as BL
import Data.List

main :: IO ()
main = do
  result <- query "Monad"
  putStrLn $ show $ result
  return ()
  
    
