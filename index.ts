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

export default config;
