# My Website

The source code for my [website](joshuaji.com), written in Elm.

## Run Locally

Make sure you have npm, elm and elm-live installed.

Once you git clone or download the repository, run the following command in the root folder.

`elm-live src/Main.elm --pushstate -- --output=elm.js`

We use an output=elm.js as an parameter because I have the index.html file ready where I use javascript flags. It'll use a generateed elm.js file.
