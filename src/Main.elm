module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Element as E

import Msg

import Url
import Url.Parser

import V.Desktop.Home

main = Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlRequest = Msg.LinkClicked
    , onUrlChange = Msg.UrlChanged
    }

type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg.Msg)
init flags url key =
    (
        { key = key
        , url = url
        }
        , Cmd.none
    )

update : Msg.Msg -> Model -> (Model, Cmd Msg.Msg)
update msg model =
    case msg of
        Msg.LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( { model | url = url }
                    , Cmd.none
                    )
                Browser.External href ->
                    ( model, Nav.load href )
        Msg.UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )

subscriptions model =
    Sub.none

view : Model -> Browser.Document msg
view model =
    case toRoute model.url of
        Home ->
            V.Desktop.Home.view "waneella" model
        
routeParser : Url.Parser.Parser (Route -> a) a
routeParser =
    Url.Parser.oneOf
        [ Url.Parser.map Home (Url.Parser.s "home")
        ]

toRoute url =
    Maybe.withDefault Home <| Url.Parser.parse routeParser url

type Route
    = Home
