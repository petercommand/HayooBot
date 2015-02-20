{-# LANGUAGE OverloadedStrings #-}
import HayooBot.Types
import HayooBot.Msg
import HayooBot.Connect 
import qualified HayooBot.Config as Config
import Control.Monad
import Control.Monad.Fix
import Control.Concurrent
import Network (withSocketsDo)
import qualified Data.ByteString.Char8 as B
main :: IO ()
main = withSocketsDo $ do
         let conn = IrcConn { serverIP = Config.serverIP, serverPort = Config.port, nickName = Config.nickName, realName = Config.realName, channelList = Config.channels }
         connHandle <- connectServer conn
         _ <- forkIO $ monitorConn connHandle conn
         _ <- fix $ \loop -> do
                         msg <- readMsg
                         mainLoop msg
                         loop
         return ()
    where
      mainLoop :: B.ByteString -> IO ()
      mainLoop msg = do
         case processMsg msg of
           Just a -> do
             let msg = responseMsg a
             return ()
           Nothing -> return ()

    

