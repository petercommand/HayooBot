module HayooBot.Connect where



connectServer :: IrcConn -> IO Handle
connectServer = const $ return ()



monitorConn :: Handle -> IrcConn -> IO ()
monitorConn a b = return ()
