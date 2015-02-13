{-# LANGUAGE OverloadedStrings #-}

module HayooBot.Query (query) where
    
import qualified Data.ByteString.Lazy.Char8 as BL
import qualified Data.ByteString.Char8 as BS
import Data.Monoid
import Network.HTTP.Client
import qualified Network.HTTP.Base as H
import Control.DeepSeq
import Debug.Trace (trace)


baseurl = "http://hayoo.fh-wedel.de/json?query="
    
query :: BL.ByteString -> IO [BL.ByteString]
query input = do
  let req = parseUrl $ BL.unpack (baseurl <> (BL.pack $ H.urlEncode $ BL.unpack input :: BL.ByteString))
  case req of
    Just a  -> withManager defaultManagerSettings (\man -> withResponse a man responseFunc)
      where
        -- Response BodyReader ~ Response (IO ByteString)
        responseFunc :: Response BodyReader -> IO [BL.ByteString]
        responseFunc response = do
                case responseStatus response of
                  status200 -> do
                    res <- brConsume $ responseBody response
                    return $ [BL.concat $ map BL.fromStrict res]
                  _   -> return []
    Nothing -> return []

