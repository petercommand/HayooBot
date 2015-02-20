{-# LANGUAGE OverloadedStrings #-}
module HayooBot.Msg where

import HayooBot.Types

import qualified Data.ByteString.Char8 as B
    
readMsg :: IO B.ByteString
readMsg = undefined



responseMsg :: Msg -> IO ()
responseMsg msg = do
  return ()



processMsg :: B.ByteString -> Maybe Msg
processMsg msg = undefined
