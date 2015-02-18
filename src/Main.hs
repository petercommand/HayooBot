{-# LANGUAGE OverloadedStrings #-}
import HayooBot.Query
import HayooBot.Types
import HayooBot.Msg
import HayooBot.Connect (connectServer)
import HayooBot.Config
import Control.Monad

main :: IO ()
main = do
  let conn = IrcConn { serverIP = serverip, serverPort = port, nickName = nickname, realName = realName, channelList = channels }
  connHandle <- connectServer conn
  forkIO $ monitorConn connHandle conn
  fix $ \loop -> do
         msg <- readMsg
         mainLoop msg
         loop
  return ()
    where
      mainLoop :: IO ()
      mainLoop msg = do
         case processMsg msg of
           Just a -> responseMsg a
           Nothing -> return ()

    

