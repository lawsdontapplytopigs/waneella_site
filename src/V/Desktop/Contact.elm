module V.Desktop.Contact exposing
    ( view 
    )

import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Font as EFont
import Element.Input as EInput

import Html
import Html.Attributes
import Html.Events

import Palette
import Msg

import V.Desktop.Lib

view title model =
    { title = title
    , body =
        [ E.layout
            [ E.inFront (V.Desktop.Lib.navbar model)
            ]
            <| mainDocumentColumn model
        ]
    }

mainDocumentColumn model =
    E.column
        [ EBackground.color Palette.color1
        , E.width E.fill
        , E.height E.fill
        , E.paddingEach 
            { top = 64 + 60
            , right = 0
            , bottom = 0
            , left = 0
            }
        ]
        [ letterBlock model
        ]

letterBlock model =
    let
        letterBlockWidth = 600
        letterBlockHeight = 700

        commonStyling : List (E.Attribute msg)
        commonStyling =
            let
                barHeight = 32
            in
            [ E.width <| E.px (letterBlockWidth - 60)
            , E.height <| E.px barHeight
            , EFont.size 17
            , EFont.color <| E.rgb255 255 255 255
            , EFont.family 
                [ EFont.typeface Palette.font1
                ]
            , E.centerX
            , EBorder.width 2
            -- , EBackground.color <| E.rgb255 30 46 75
            , EBackground.color Palette.color2
            , EBorder.color <| E.rgb255 25 40 65
            , EBorder.rounded (round (barHeight / 2))
            , E.htmlAttribute <| Html.Attributes.style "height" "30px"
            ]

        subjectRoundedBar : String -> E.Element Msg.Msg
        subjectRoundedBar text =
                EInput.text
                    ([] ++ commonStyling)
                    { onChange = (\s -> Msg.SubjectInput s)
                    , text = text
                    , placeholder = Nothing
                    , label = EInput.labelAbove 
                        [ EFont.color Palette.color5
                        ] 
                        <| E.text "Subject"
                    }

        emailRoundedBar : String -> E.Element Msg.Msg
        emailRoundedBar text =
                EInput.email
                    ([] ++ commonStyling)
                    { onChange = (\s -> Msg.EmailInput s)
                    , text = text
                    , placeholder = Nothing
                    , label = EInput.labelAbove 
                        [ EFont.color Palette.color5
                        ] 
                        <| E.text "Email"
                    }

        messageField : String -> E.Element Msg.Msg
        messageField text =
            let
                barHeight = 32
            in
                EInput.multiline
                    [ E.width <| E.px (letterBlockWidth - 60)
                    , E.height E.fill
                    , EFont.size 17
                    , EFont.color <| E.rgb255 255 255 255
                    , EFont.family 
                        [ EFont.typeface Palette.font1
                        ]
                    , E.centerX
                    , EBorder.width 2
                    , EBackground.color <| E.rgb255 30 46 75
                    , EBorder.color <| E.rgb255 25 40 65
                    , EBorder.rounded (round (barHeight / 2))
                    , E.htmlAttribute <| Html.Attributes.style "height" "30px"
                    ]
                    { onChange = (\s -> Msg.MessageInput s)
                    , text = text
                    , placeholder = Nothing
                    , label = EInput.labelAbove 
                        [ EFont.color Palette.color3
                        ] 
                        <| E.text "Message"
                    , spellcheck = True
                    }
    
    in
    E.column
        [ E.height <| E.px letterBlockHeight
        , E.width <| E.px letterBlockWidth
        , E.centerX
        , EBackground.color <| Palette.color2
        -- , EBackground.color <| E.rgb255 20 42 70
        , EBorder.rounded 10
        ]
        [ subjectRoundedBar <|
            case model.contactData.subject of
                Nothing ->
                    ""
                Just str ->
                    str
                
        , emailRoundedBar <|
            case model.contactData.email of
                Nothing ->
                    ""
                Just str ->
                    str

        , messageField <|
            case model.contactData.message of
                Nothing ->
                    ""
                Just str ->
                    str
        ]

