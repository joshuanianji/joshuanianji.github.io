import './main.css';
import { Elm } from './Main.elm';
import * as serviceWorker from './serviceWorker';
import projectsJson from './projects.json'

// assets
import derivativesSrc from './img/proj_icons/derivatives.png';
import hiitTimerSrc from './img/proj_icons/hiit-timer.png';
import ptableSrc from './img/proj_icons/ptable.png';
import uiBootstrapSrc from './img/proj_icons/ui-bootstrap.png';

var projIcons = [{
    src: derivativesSrc,
    id: 'derivative'
},
{
    src: hiitTimerSrc,
    id: 'hiit-timer'
},
{
    src: ptableSrc,
    id: 'ptable'
},
{
    src: uiBootstrapSrc,
    id: 'ui-bootstrap'
}]


Elm.Main.init({
    node: document.getElementById('root'),
    flags: {
        windowSize: {
            height: window.innerHeight,
            width: window.innerWidth
        },
        projectsJson: projectsJson,
        projectIcons: projIcons
    }
});

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
