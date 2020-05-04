module V.Desktop.Lib exposing
    ( navbar
    )

import Element as E
import Element.Background as EBackground
import Element.Font as EFont

import Html
import Html.Attributes

import Icons

import Palette

navbar model =
    let
        icon ic =
            E.el 
                [ E.height <| E.px 21
                , E.width <| E.px 21
                ] 
                (E.html ic)

        navbarLink text url =
            E.column
                [ E.centerY
                ]
                [ E.el
                    [ EBackground.color <| E.rgb255 20 20 20
                    , E.height <| E.px 6
                    ]
                    <| E.text ""
                , E.link
                    [ EFont.size 14
                    , EFont.color <| E.rgb255 255 255 255
                    , EFont.family
                        [ EFont.typeface Palette.font1
                        ]
                    -- , E.htmlAttribute <| Html.Attributes.style "text-transform" "uppercase"
                    , EFont.letterSpacing 1
                    ]
                    { url = url
                    , label = E.text text
                    }
                ]

    in
    E.row
        [ E.width E.fill
        , E.height <| E.px 64
        , EBackground.color <| E.rgb255 16 21 38
        -- , EBackground.color <| E.rgb255 200 230 255
        ]
        [ E.row
            [ E.width <| E.maximum 1440 E.fill
            , E.height E.fill
            , E.centerX
            -- , E.htmlAttribute <| Html.Attributes.style "transform" "skew(-8deg)"
            ]
            [ E.row 
                [ E.alignLeft 
                , E.spacing 30
                ] 
                [ E.el 
                    [ EFont.size 20
                    , EFont.heavy
                    , EFont.italic
                    , EFont.color <| E.rgb255 255 255 255
                    , EFont.letterSpacing 2
                    , EFont.family
                        [ EFont.typeface Palette.font0
                        ]
                    , E.htmlAttribute <| Html.Attributes.style "text-transform" "uppercase"
                    ]
                    <| E.text "WANEELLA"
                , E.row
                    [ E.spacing 10
                    ]
                    [ navbarLink "Home" "/"
                    , navbarLink "Expo" "/expo"
                    , navbarLink "Contact" "/contact"
                    ]
                ]
            , E.row
                [ E.alignRight 
                , E.spacing 10
                ] 
                [ icon Icons.bandcamp
                , icon Icons.tumblr
                , icon Icons.instagram
                ]
            ]
        ]

