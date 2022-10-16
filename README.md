# elm-bootstrap-sampleapp

create project

```bash
$ mkdir elm-bootstrap-sampleapp 
$ cd elm-bootstrap-sampleapp 
$ npm init -y
```

install bootstrap[^1]

```bash
$ npm i --save-dev parcel
$ npm i --save-dev bootstrap @popperjs/core
```

install Elm

```bash
$ npm i --save-dev elm @parcel/transformer-elm
$ npx elm init
```

create files

```bash
$ touch src/index.html src/index.js src/index.scss src/Main.elm
```

write `src/index.html`

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="index.scss" rel="stylesheet">
</head>
<body>
  <div id="root"></div>
  <script type="module" src="index.js"></script>
</body>
</html>
```

write `src/index.js`

```js
import * as bootstrap from "bootstrap";
import { Elm } from "./Main.elm";

Elm.Main.init({ node: document.getElementById("root") });
```

write `src/index.scss`

```scss
@import "bootstrap/scss/bootstrap";
```

write `src/Main.elm`

```elm
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
```

rewrite `package.json`
delete a line of `"main": "src/index.js"` and add the following

```json
  "scripts": {
    "start": "parcel src/index.html",
    "build": "parcel build src/index.html --no-source-maps",
    "clean": "rm dist/*; rm .parcel-cache/*"
  },
```

Let's build

```bash
$ npm run build
```

[^1]: https://getbootstrap.com/docs/5.2/getting-started/parcel/
