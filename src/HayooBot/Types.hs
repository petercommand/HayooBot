module HayooBot.Types where
import Data.ByteString.Char8

data MsgType = ChanMsg ByteString | PrivMsg ByteString
    
data Msg = Msg { msgType :: !MsgType,
                 msgBody :: !ByteString
               }


data IrcConn = IrcConn { serverIP :: !ByteString,
                         serverPort :: !Int,
                         nickName :: !ByteString,
                         realName :: !ByteString,
                         channelList :: ![ByteString]
                       }
