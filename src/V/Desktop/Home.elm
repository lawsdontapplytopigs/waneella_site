module V.Desktop.Home exposing 
    ( view )

import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Font as EFont
import Element.Input as EInput

import Html.Attributes

import Msg
import Palette

import V.Desktop.Lib as VLib

view title model = 
    { title = title
    , body = 
        [ (E.layout
            [ E.inFront (VLib.navbar model)
            ]
            <| mainDocumentColumn model
          )
        ]
    }

mainDocumentColumn model =
    E.column
        [ EBackground.color Palette.color0
        , E.width E.fill
        , E.paddingEach 
            { top = 64 -- the navbar height
            , right = 0
            , bottom = 0
            , left = 0
            }
        -- , E.height <| E.px 800
        ]
        [ block0 model
        , gallery model
        , block1 model
        ]

block0 model = 
    let
        firstInnerBlockWidth = 860

        roundedBar : Int -> Float -> E.Element msg
        roundedBar fullBarWidth percent =
            let
                barHeight = 32
                percentageEl =
                    E.el
                        [ E.centerY
                        , E.centerX
                        , EFont.size 18
                        , EFont.color <| E.rgb255 255 255 255
                        , EFont.family 
                            [ EFont.typeface Palette.font1
                            ]
                        ]
                        <| E.text ((String.fromInt (round (percent * 100))) ++ "%")
            in
            E.el
                -- [ EBackground.color <| E.rgb255 150 100 20
                [ EBackground.color <| E.rgb255 130 60 50
                , E.width <| E.px fullBarWidth
                , E.height <| E.px barHeight
                , EBorder.rounded (round (barHeight / 2))
                , E.inFront <| percentageEl
                ]
                <| E.el
                    -- [ EBackground.color <| E.rgb255 255 200 110
                    [ EBackground.color <| E.rgb255 255 120 110
                    , E.width <| E.px (round (percent * (toFloat fullBarWidth)))
                    , E.height <| E.px barHeight
                    , EBorder.rounded ( round (barHeight / 2))
                    ]
                    <| E.text ""

        button = 
            let
                height = 200
                width = 56
            in
                EInput.button
                    [ E.width <| E.px height
                    , E.height <| E.px width
                    -- , EBackground.color <| E.rgb255 60 140 160
                    , EBorder.rounded (round (width / 2))
                    , EBorder.width 2
                    , EFont.size 18
                    , EFont.color <| E.rgb255 255 255 255
                    , EFont.family 
                        [ EFont.typeface Palette.font1
                        ]
                    , E.centerX
                    ]
                    { onPress = Just Msg.NoOp -- TODO
                    , label = E.el [ E.centerX ] <| E.text "Support me on Patreon"
                    }
    in
    E.el
        [ E.height <| E.px 560
        , E.width E.fill
        , EBackground.color Palette.color2
        ]
        <| E.el
            [ E.width <| E.px firstInnerBlockWidth
            , E.height E.fill
            -- , EBackground.color <| E.rgb255 30 50 70
            , E.centerX
            ]
            <| E.column
                [ E.centerX
                , E.centerY
                -- , EBackground.color <| E.rgb255 60 100 120
                , E.spacing 60
                ]
                [ E.row
                    [ E.centerX
                    , E.centerY
                    , E.spacing 60
                    -- , EBackground.color <| E.rgb255 80 120 150
                    , E.alignTop
                    ]
                    [ E.image
                        [ E.height <| E.px 180
                        , E.width <| E.px 180
                        , E.htmlAttribute <| Html.Attributes.style "border-radius" "50%"
                        , E.htmlAttribute <| Html.Attributes.style "overflow" "hidden"
                        , EBorder.width 4
                        , EBorder.color <| E.rgb255 160 160 160
                        ]
                        { src = "../../../assets/hr_real_size_fixed.gif"
                        , description = "POG"
                        }
                    
                    , E.column
                        [ E.width E.fill
                        ]
                        [ E.paragraph
                            [ EFont.size 34
                            , EFont.semiBold
                            , EFont.color <| E.rgb255 255 255 255
                            , EFont.family 
                                [ EFont.typeface Palette.font1
                                ]
                            , E.paddingEach { top = 0, right = 0, bottom = 20, left = 0 }
                            ] 
                            [ E.text "Hi, I'm waneella."
                            ]
                                -- a pixel artist based in Tokyo.
                        , E.column
                            [ E.width <| E.px 360
                            , EFont.size 18
                            , EFont.color <| E.rgb255 255 255 255
                            , EFont.family 
                                [ EFont.typeface Palette.font1
                                ]
                            , E.spacing 10
                            ] 
                            [ E.paragraph
                                []
                                [ E.text "I'm an artist based in Tokyo, Japan and I make pixel art."
                                ]
                            , E.paragraph
                                []
                                [ E.text "Many wish they could do something they loved for money, instead of the job that pays the bills. I guess I'm the same way."
                                ]
                            , E.paragraph
                                []
                                [ E.text "If you like my work, I would really appreciate if you helped me reach my goal on Patreon."
                                ]
                            ]
                        ]
                    ]
                , E.column
                    [ E.centerX
                    , E.spacing 30
                    ]
                    [ button
                    , E.el
                        [ E.centerX
                        ]
                        <| roundedBar (firstInnerBlockWidth - 300) 0.6
                    ]
                ]

gallery model =
    let
        button = 
            let
                width = 140
                height = 56
            in
                EInput.button
                    [ E.width <| E.px width
                    , E.height <| E.px height
                    -- , EBackground.color <| E.rgb255 60 140 160
                    , EBorder.rounded (round (width / 2))
                    , EBorder.width 2
                    , EFont.size 18
                    , EFont.color <| E.rgb255 255 255 255
                    , EFont.family 
                        [ EFont.typeface Palette.font1
                        ]
                    , E.centerX
                    , E.centerY
                    ]
                    { onPress = Just Msg.NoOp
                    , label = E.el [ E.centerX ] <| E.text "See More"
                    }
    in
    E.column
        [ E.height <| E.px 760
        -- , EBackground.color <| E.rgb255 40 60 90
        , E.width E.fill
        -- , EBackground.color Palette.color1
        -- TODO: get some cool pattern and add it here
        -- , E.htmlAttribute <| Html.Attributes.style "background-repeat" "repeat"
        -- , E.htmlAttribute <| Html.Attributes.style "background-image" "url(../../../assets/pixel-heart.png)"
        -- , E.htmlAttribute <| Html.Attributes.style "background-size" "auto"
        -- , E.htmlAttribute <| Html.Attributes.style "background-blend-mode" "overlay"
        , EBackground.gradient
            { angle = 3.14
            , steps =
                [ Palette.color0
                , Palette.color1
                , Palette.color1
                , Palette.color1
                , Palette.color1
                , Palette.color1
                , Palette.color0
                ]
            }
        ]
        [ E.el
            [ E.height E.fill
            , E.centerX
            , E.centerY
            , EFont.size 22
            , EFont.color <| E.rgb255 255 255 255
            , EFont.family 
                [ EFont.typeface Palette.font1
                ]
            , EFont.letterSpacing 4
            , EFont.semiBold
            , E.htmlAttribute <| Html.Attributes.style "text-transform" "uppercase"
            ]
            <| E.el [ E.centerY ] <| E.text "Expo"
        , E.row
            [ E.centerX
            , E.centerY
            , E.spacing 140 -- TODO: get proper spacing
            -- , EBackground.color <| E.rgb255 80 80 80
            ]
            ( List.map littleExpoPost model.posts )
        , E.el 
            [ E.height E.fill
            , E.width E.fill 
            ] <| button
        ]

block1 model =
    E.el
        [ E.height <| E.px 300
        , EBackground.color <| Palette.color2
        -- , EBackground.color <| E.rgb255 20 20 20
        , E.width E.fill
        ]
        <| E.text ""

littleExpoPost { title, src } =
    let
        img source =
            E.image
                [ E.height <| E.px 420 -- haha lol 420 blazeit 8888888)
                , EBorder.shadow
                    { blur = 18.0
                    , color = E.rgb255 0 0 0
                    , offset = (0.1, 0.1)
                    , size = 2.0
                    }
                ]
                { src = source
                , description = "Img"
                }
    in
    E.column
        [ E.spacing 10
        -- , EBackground.color <| E.rgb255 80 80 80
        ]
        [ img src
        , E.el
            [ EFont.size 18
            , EFont.medium
            , EFont.color <| E.rgb255 255 255 255
            , EFont.family 
                [ EFont.typeface Palette.font1
                ]
            ]
            <| E.text title
        ]

