module V.Desktop.Home exposing 
    ( view )

import Element as E
import Element.Background as EBackground
import Element.Border as EBorder

view title model = 
    { title = title
    , body = 
        [ (E.layout
            [
            ]
            <| mainDocumentColumn model
          )
        ]
    }

mainDocumentColumn model =
    E.column
        [ EBackground.color <| E.rgb255 250 240 200
        , E.width E.fill
        , E.height <| E.px 800
        ]
        [ gallery model
        ]

gallery model =
    E.column
        [
        ]
        [ img "../../../samples/img_0.gif"
        , img "../../../samples/img_1.gif"
        ]

img src =
    E.image
        [ E.width <| E.px 600
        ]
        { src = src
        , description = "Img"
        }
