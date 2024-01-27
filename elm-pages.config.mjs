import { defineConfig } from "vite";

export default {
  vite: defineConfig({}),
  headTagsTemplate(context) {
    return `
<link rel="stylesheet" href="/style.css" />
<meta name="generator" content="elm-pages v${context.cliVersion}" />
<link
    href="https://fonts.googleapis.com/css2?family=Lato:wght@300;700&family=Playfair+Display+SC:wght@700&display=swap"
    rel="stylesheet" />
`;
  },
  preloadTagForFile(file) {
    // add preload directives for JS assets and font assets, etc., skip for CSS files
    // this function will be called with each file that is procesed by Vite, including any files in your headTagsTemplate in your config
    return !file.endsWith(".css");
  },
};
