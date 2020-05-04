module Msg exposing 
    ( Msg(..) 
    )

import Browser
import Url

type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | NoOp

    | SubjectInput String
    | EmailInput String
    | MessageInput String
