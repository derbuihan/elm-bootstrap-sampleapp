module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { score : Int
    }


init : Model
init =
    { score = 0
    }


type Msg
    = Select String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Select _ ->
            { model | score = model.score + 1 }


view : Model -> Html Msg
view model =
    div []
        [ button
            [ class "btn btn-primary", onClick (Select "a") ]
            [ text (String.fromInt model.score) ]
        ]