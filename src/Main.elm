module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Element as E

import Msg

import SampleData

import Url
import Url.Parser

import V.Desktop.Home
import V.Desktop.Contact

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
    , posts : List SampleData.Post
    , contactData : ContactData
    }

type alias ContactData =
    { subject : Maybe String
    , email : Maybe String
    , message : Maybe String
    }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg.Msg)
init flags url key =
    (
        { key = key
        , url = url
        , posts = SampleData.posts
        , contactData =
            { subject = Nothing
            , email = Nothing
            , message = Nothing
            }
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
                    , Nav.load (Url.toString url)
                    )
                Browser.External href ->
                    ( model, Nav.load href )
        Msg.UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )
        Msg.NoOp ->
            ( model, Cmd.none )

        Msg.SubjectInput str ->
            ( { model 
                | contactData =
                    { subject = Just str
                    , email = model.contactData.email
                    , message = model.contactData.message
                    }
              }
            , Cmd.none
            )
        Msg.EmailInput str ->
            ( { model 
                | contactData =
                    { subject = model.contactData.subject
                    , email = Just str
                    , message = model.contactData.message
                    }
              }
            , Cmd.none
            )
        Msg.MessageInput str ->
            ( { model 
                | contactData =
                    { subject = model.contactData.subject
                    , email = model.contactData.email
                    , message = Just str
                    }
              }
            , Cmd.none
            )

subscriptions model =
    Sub.none

view : Model -> Browser.Document Msg.Msg
view model =
    case toRoute model.url of
        Home ->
            V.Desktop.Home.view "waneella" model
        Contact ->
            V.Desktop.Contact.view "waneella - Contact" model
        
routeParser : Url.Parser.Parser (Route -> a) a
routeParser =
    Url.Parser.oneOf
        [ Url.Parser.map Home (Url.Parser.s "home")
        , Url.Parser.map Contact (Url.Parser.s "contact")
        ]

toRoute url =
    Maybe.withDefault Home <| Url.Parser.parse routeParser url

type Route
    = Home
    | Contact
