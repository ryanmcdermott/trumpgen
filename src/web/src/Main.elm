import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Html.Events exposing ( onClick )
import Http
import Json.Decode as Json
import Task

appUrl = "http://localhost:8888/api/speeches/"

-- APP
main : Program Never
main =
  Html.program 
    { init = init "Click the button to generate a speech"
    , view = view
    , update = update 
    , subscriptions = subscriptions 
    }


getSpeech : Cmd Msg
getSpeech =
    Task.perform FetchFail FetchSucceed (Http.get decodeSpeech appUrl)


decodeSpeech : Json.Decoder String
decodeSpeech =
    Json.at ["speech"] Json.string


type Msg
  = NewSpeech
  | FetchSucceed String
  | FetchFail Http.Error


-- MODEL
type alias Model =
    { speech : String
    }


init : String -> (Model, Cmd Msg)
init speech  =
  ( Model speech
  , getSpeech 
  )


-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NewSpeech ->
      (model, getSpeech)

    FetchSucceed speech ->
      (Model speech, Cmd.none)

    FetchFail _ ->
      (model, Cmd.none)



-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- VIEW
view : Model -> Html Msg
view model =
  div [ class "container", style [("margin-top", "30px"), ( "text-align", "center"), ( "background-color", "auto")] ][
    div [ class "row" ][
      div [ class "col-xs-12" ][
        text model.speech
        , button [ onClick NewSpeech] [ text "Generate Speech!" ]
      ]
    ]
  ]


-- CSS STYLES
styles : { body: List ( String, String) , img : List ( String, String ) }
styles =
  {
    body =
    [
        ( "background-color", "auto !important")
    ],
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
