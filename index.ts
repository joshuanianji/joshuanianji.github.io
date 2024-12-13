import hljs from 'highlight.js/lib/core';
import javascript from 'highlight.js/lib/languages/javascript';
import python from 'highlight.js/lib/languages/python';
import bash from 'highlight.js/lib/languages/bash';
import plaintext from 'highlight.js/lib/languages/plaintext';
import yaml from 'highlight.js/lib/languages/yaml';
hljs.registerLanguage('javascript', javascript);
hljs.registerLanguage('python', python);
hljs.registerLanguage('bash', bash);
hljs.registerLanguage('plaintext', plaintext);
hljs.registerLanguage('yaml', yaml);

import 'highlight.js/styles/atom-one-dark.css';

type ElmPagesInit = {
    load: (elmLoaded: Promise<unknown>) => Promise<void>;
    flags: unknown;
};

const config: ElmPagesInit = {
    load: async function (elmLoaded) {
        const app = await elmLoaded;

        console.log('App loaded', app)

        // updateMousePos ports
        const homeElem = document.querySelector('#home')
        const icoElem = document.querySelector('#icosahedron');
        if (homeElem && icoElem) {
            homeElem.addEventListener('mousemove', function (e) {
                let rect = icoElem.getBoundingClientRect();

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
            console.log('Added event listener for mousemove homepage')
        }
    },
    flags: function () {
        return "You can decode this in Shared.elm using Json.Decode.string!";
    },
};

// Highlight.js editing the DOM doesn't work well with Elm
// custom elements work better since it is not managed by Elm
// I tried using web components (custom elements with Shadow DOM)
// but it was too tricky getting the shadow DOM to import the highlight.js CSS from the main DOM
customElements.define('highlightjs-code',
    class extends HTMLElement {
        codeElem: HTMLElement;

        constructor() {
            super();
        }
        connectedCallback() { this.setTextContent(); }
        attributeChangedCallback() { this.setTextContent(); }
        static get observedAttributes() { return ['lang', 'code']; }

        // Our function to set the textContent based on attributes.
        setTextContent() {
            const lang = this.getAttribute('lang') || 'plaintext';
            const code = this.getAttribute('code') || '';
            const hljsVal = hljs.highlight(code, { language: lang });
            this.innerHTML = `
            <style>
                code {
                    border-radius: 0.5em;
                    font-size: 0.75em;
                }
            </style>
            <pre><code class="hljs language-${lang}">${hljsVal.value}</code></pre>
            `
        }
    }
);


export default config;
