import './main.css';
import { Elm } from './Main.elm';
import * as serviceWorker from './serviceWorker';
import projectsJson from './projects.json'

// assets
import derivativesSrc from './img/proj_icons/derivatives.png';
import hiitTimerSrc from './img/proj_icons/hiit-timer.png';
import ptableSrc from './img/proj_icons/ptable.png';
import uiBootstrapSrc from './img/proj_icons/ui-bootstrap.png';
import atomicTheory from './img/proj_icons/atomic-theory.png';
import cli from './img/proj_icons/cli.png';
import defaultIcon from './img/proj_icons/default_icon.png'

var projIcons = [{
    src: derivativesSrc,
    id: 'derivative'
}, {
    src: hiitTimerSrc,
    id: 'hiit-timer'
}, {
    src: ptableSrc,
    id: 'ptable'
}, {
    src: uiBootstrapSrc,
    id: 'ui-bootstrap'
}, {
    src: atomicTheory,
    id: 'atomic-theory'
}, {
    src: cli,
    id: 'cli'
}]


const app = Elm.Main.init({
    node: document.getElementById('root'),
    flags: {
        windowSize: {
            height: window.innerHeight,
            width: window.innerWidth
        },
        projectsJson: projectsJson,
        projectIcons: {
            icons: projIcons,
            default: defaultIcon
        },
        icoSeed: Math.floor(Math.random() * 360), // random degrees
    }
});

/*!
    * Determine if an element is in the viewport
    * Super simple becuase the icosahedron only needs to be scrolled down, not up.
    * I will keep the distance variable because i might need more complex things later on.
    */
const notInViewport = function (elem) {
    var distance = elem.getBoundingClientRect();
    return (distance.bottom <= 0);
};

window.onload = function () {
    app.ports.scroll.send(null);

    let ico_elem = document.querySelector('#icosahedron');
    let tracker = notInViewport(ico_elem);

    window.addEventListener('scroll', function (event) {
        let outOfBounds = notInViewport(ico_elem)
        // if statements only run if the previous tracker var and the new out of bounds var is DIFFERENT
        if (tracker && !outOfBounds) {
            console.log('In viewport!');
            app.ports.updateHomeViewport.send(true);
            tracker = false;
        } else if (!tracker && outOfBounds) {
            console.log('Not in viewport!');
            app.ports.updateHomeViewport.send(false);
            tracker = true;
        }
    }, false);

    document.querySelector('#home').addEventListener('mousemove', function (e) {
        let rect = ico_elem.getBoundingClientRect();

        // calculating grid where the middle is (0, 0)
        let height = rect.bottom - rect.top;
        let width = rect.right - rect.left;
        let x = e.clientX - rect.left - width / 2;
        let y = rect.top - e.clientY + height / 2;

        let hypotenuse = Math.sqrt(x * x + y * y)

        app.ports.updateMousePos.send({
            x: x / hypotenuse,
            y: y / hypotenuse
        })
    })

}



// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();


// here is the old school projects I did not include in my thing
/*{
        "name": "Country Fact Finder",
        "imgLink": null,
        "blurb": "An application that parses and displays information from 5 text files.",
        "githubLink": "https://github.com/joshuanianji/Country-Fact-Finder",
        "link": "https://joshuaji.com/projects/fact-finder",
        "year": 2019,
        "language": "Elm",
        "concepts": [],
        "pinned": false
    },
    {
        "name": "WordRank",
        "imgLink": null,
        "blurb": "An application that ranks words based on usage from a string input or a text file.",
        "githubLink": "https://github.com/joshuanianji/Wordrank",
        "link": "https://joshuaji.com/projects/word-rank",
        "year": 2019,
        "language": "Elm",
        "pinned": false
    },
    {
        "name": "Cryptography",
        "imgLink": null,
        "blurb": "An app that deals with Caesar and Viginere cyphers, and can calculate hashes.",
        "githubLink": "https://github.com/joshuanianji/Cryptography",
        "link": "https://joshuaji.com/projects/cryptography",
        "year": 2018,
        "language": "Elm",
        "pinned": false
    }
    */