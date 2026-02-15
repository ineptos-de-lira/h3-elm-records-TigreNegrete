module Helper exposing (..)
import Html exposing (..)

add2 : Int -> Int -> Int
add2 int1 int2 =
    int1 + int2

add3: Float -> Float -> Float -> Float
add3 int1 int2 int3 =
    int1 + int2 + int3

calc : Int -> Int -> (Int -> Int -> Int) -> Int
calc int1 int2 operator =
    operator int1 int2

language : List { name : String, releaseYear : Int, currentVersion : String }
language =
    [ { name = "Elm", releaseYear = 2012, currentVersion = "0.19.1" }
    , { name = "Python", releaseYear = 1991, currentVersion = "3.14" }
    ]


languageNames : List { name : String, releaseYear : Int, currentVersion : String } -> List String
languageNames list =
    List.map .name list


user : List { name : String, uType : String }
user =
    [ { name = "Alice", uType = "Student" }
    , { name = "Bob", uType = "Professor" }
    ]


onlyStudents : List { name : String, uType : String } -> List String
onlyStudents list =
    case list of
        [] ->
            []

        x :: xs ->
            if x.uType == "Student" then
                x.name :: onlyStudents xs

            else
                "" :: onlyStudents xs


type alias Videogame =
    { title : String, releaseYear : Int, available : Bool, downloads : Int, genres : List String }


videogames : List Videogame
videogames =
    [ { title = "RDR2", releaseYear = 2018, available = True, downloads = 5000000, genres = [ "Action", "Adventure" ] }
    , { title = "The Witcher 3", releaseYear = 2015, available = True, downloads = 3000000, genres = [ "RPG", "Adventure" ] }
    ]


getVideogameGenres : List Videogame -> List (List String)
getVideogameGenres list =
    List.map .genres list


type alias Computer =
    { ram : String, model : String, brand : String, screenSize : String }


myLaptop : Computer
myLaptop =
    { ram = "16GB", model = "XPS 15", brand = "Dell", screenSize = "15.6 inches" }


main : Html.Html msg
main =
    Html.div []
        [ Html.h1 [] [ Html.text "My laptop" ]
        , Html.div []
            [ Html.ul []
                [ Html.li [] [ Html.text ("Ram: " ++ myLaptop.ram) ]
                , Html.li [] [ Html.text ("Modelo: " ++ myLaptop.model) ]
                , Html.li [] [ Html.text ("Marca: " ++ myLaptop.brand) ]
                , Html.li [] [ Html.text ("Pulgadas: " ++ myLaptop.screenSize) ]
                ]
            ]
        ]
