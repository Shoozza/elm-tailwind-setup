module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Html.Attributes exposing (attribute)


type alias Model =
    { count : Int }


initialModel : Model
initialModel =
    { count = 0 }


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }


view : Model -> Html Msg
view model =
    div []
        [ basicButton [ onClick Increment ] [ text "+1" ]
        , div [] [ text <| String.fromInt model.count ]
        , basicButton [ onClick Decrement ] [ text "-1" ]
        ]


basicButton : List (Html.Attribute msg) -> List (Html msg) -> Html msg
basicButton attributes contents =
    button
        (class "bg-blue-600 px-6 py-2 text-white rounded-md m-2" :: attributes)
        ([] ++ contents)

main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
