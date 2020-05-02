module SampleData exposing (..)

posts =
    [
        { title = "12.524345, 45.257297" 
        , src = "../../../samples/posts/img_3.gif"
        }
    ,   { title = "sick flag waving" 
        , src = "../../../samples/posts/img_4.gif"
        }
    ,   { title = "15.254724 64.374382" 
        , src = "../../../samples/posts/img_2.gif"
        }
    ]

type alias Post =
    { title : String
    , src : String
    }
