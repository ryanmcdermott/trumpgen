import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Html.Events exposing ( onClick )
import Http
import Json.Decode as Json
import Task

appUrl = "/api/speeches/"

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
      , fetching : Bool
    }


setFetching : String -> Bool -> Model 
setFetching speech fetching = 
    Model speech fetching

init : String -> (Model, Cmd Msg)
init speech  =
  ( Model speech True
  , getSpeech 
  )


-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NewSpeech ->
      (setFetching model.speech True, getSpeech)

    FetchSucceed speech ->
      (setFetching speech False, Cmd.none)

    FetchFail _ ->
      (setFetching model.speech False, Cmd.none)



-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- VIEWS
speechView model =
  if model.fetching then
    div [ class "box effect5" ] [
      div [ class "loader" ] [
        text "FETCHING"
      ]
    ]
  else
    div [ class "box effect5" ] [
      text model.speech
    ]

view : Model -> Html Msg
view model =
    div [][
      
      speechView model
      , div [class "button-container"][
        a [onClick NewSpeech, class "button button-circle button-caution-flat"] [
         text "Generate Speech"
        ]
      ]
    ]

