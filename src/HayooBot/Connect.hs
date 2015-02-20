module HayooBot.Connect where

import System.IO
import qualified HayooBot.Config as Config
import HayooBot.Types
import Network
import qualified Data.ByteString.Char8 as B
connectServer :: IrcConn -> IO Handle
connectServer conn = do
  handle <- (connectTo $ B.unpack Config.serverIP) $ PortNumber $ toEnum Config.port 
  return handle


monitorConn :: Handle -> IrcConn -> IO ()
monitorConn a b = return ()
