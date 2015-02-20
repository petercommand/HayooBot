{-# LANGUAGE OverloadedStrings #-}
module HayooBot.Config where

import Data.ByteString.Char8
    
serverIP :: ByteString
serverIP = "irc.freenode.net"
port :: Int
port = 6667
realName, nickName :: ByteString
realName = "HayooBot"
nickName = "hayoobot"
channels = []
