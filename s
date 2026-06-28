[33mcommit 110ffaa16d793d08e4496c37b0fd9b02b31a0861[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mmain[m[33m)[m
Author: Sejal <beloshesejal@gmail.com>
Date:   Sun Jun 28 11:57:58 2026 +0530

    feat: complete lectures 5-8 | learned Hooks, Virtual DOM, Fiber, Reconciliation, Props, Tailwind CSS, and built a 03tailwindprops project

[1mdiff --git a/03tailwindprops/.gitignore b/03tailwindprops/.gitignore[m
[1mnew file mode 100644[m
[1mindex 0000000..a547bf3[m
[1m--- /dev/null[m
[1m+++ b/03tailwindprops/.gitignore[m
[36m@@ -0,0 +1,24 @@[m
[32m+[m[32m# Logs[m
[32m+[m[32mlogs[m
[32m+[m[32m*.log[m
[32m+[m[32mnpm-debug.log*[m
[32m+[m[32myarn-debug.log*[m
[32m+[m[32myarn-error.log*[m
[32m+[m[32mpnpm-debug.log*[m
[32m+[m[32mlerna-debug.log*[m
[32m+[m
[32m+[m[32mnode_modules[m
[32m+[m[32mdist[m
[32m+[m[32mdist-ssr[m
[32m+[m[32m*.local[m
[32m+[m
[32m+[m[32m# Editor directories and files[m
[32m+[m[32m.vscode/*[m
[32m+[m[32m!.vscode/extensions.json[m
[32m+[m[32m.idea[m
[32m+[m[32m.DS_Store[m
[32m+[m[32m*.suo[m
[32m+[m[32m*.ntvs*[m
[32m+[m[32m*.njsproj[m
[32m+[m[32m*.sln[m
[32m+[m[32m*.sw?[m
[1mdiff --git a/03tailwindprops/README.md b/03tailwindprops/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..a36934d[m
[1m--- /dev/null[m
[1m+++ b/03tailwindprops/README.md[m
[36m@@ -0,0 +1,16 @@[m
[32m+[m[32m# React + Vite[m
[32m+[m
[32m+[m[32mThis template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.[m
[32m+[m
[32m+[m[32mCurrently, two official plugins are available:[m
[32m+[m
[32m+[m[32m- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react) uses [Oxc](https://oxc.rs)[m
[32m+[m[32m- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react-swc) uses [SWC](https://swc.rs/)[m
[32m+[m
[32m+[m[32m## React Compiler[m
[32m+[m
[32m+[m[32mThe React Compiler is not enabled on this template because of its impact on dev & build performances. To add it, see [this documentation](https://react.dev/learn/react-compiler/installation).[m
[32m+[m
[32m+[m[32m## Expanding the ESLint configuration[m
[32m+[m
[32m+[m[32mIf you are developing a production application, we recommend using TypeScript with type-aware lint rules enabled. Check out the [TS template](https://github.com/vitejs/vite/tree/main/packages/create-vite/template-react-ts) for information on how to integrate TypeScript and [`typescript-eslint`](https://typescript-eslint.io) in your project.[m
[1mdiff --git a/03tailwindprops/eslint.config.js b/03tailwindprops/eslint.config.js[m
[1mnew file mode 100644[m
[1mindex 0000000..ea36dd3[m
[1m--- /dev/null[m
[1m+++ b/03tailwindprops/eslint.config.js[m
[36m@@ -0,0 +1,21 @@[m
[32m+[m[32mimport js from '@eslint/js'[m
[32m+[m[32mimport globals from 'globals'[m
[32m+[m[32mimport reactHooks from 'eslint-plugin-react-hooks'[m
[32m+[m[32mimport reactRefresh from 'eslint-plugin-react-refresh'[m
[32m+[m[32mimport { defineConfig, globalIgnores } from 'eslint/config'[m
[32m+[m
[32m+[m[32mexport default defineConfig([[m
[32m+[m[32m  globalIgnores(['dist']),[m
[32m+[m[32m  {[m
[32m+[m[32m    files: ['**/*.{js,jsx}'],[m
[32m+[m[32m    extends: [[m
[32m+[m[32m      js.configs.recommended,[m
[32m+[m[32m      reactHooks.configs.flat.recommended,[m
[32m+[m[32m      reactRefresh.configs.vite,[m
[32m+[m[32m    ],[m
[32m+[m[32m    languageOptions: {[m
[32m+[m[32m      globals: globals.browser,[m
[32m+[m[32m      parserOptions: { ecmaFeatures: { jsx: true } },[m
[32m+[m[32m    },[m
[32m+[m[32m  },[m
[32m+[m[32m])[m
[1mdiff --git a/03tailwindprops/index.html b/03tailwindprops/index.html[m
[1mnew file mode 100644[m
[1mindex 0000000..c40aeaa[m
[1m--- /dev/null[m
[1m+++ b/03tailwindprops/index.html[m
[36m@@ -0,0 +1,13 @@[m
[32m+[m[32m<!Doctype html>[m
[32m+[m[32m<html lang="en">[m
[32m+[m[32m  <head>[m
[32m+[m[32m    <meta charset="UTF-8" />[m
[32m+[m[32m    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />[m
[32m+[m[32m    <meta name="viewport" content="width=device-width, initial-scale=1.0" />[m
[32m+[m[32m    <title>03tailwindprops</title>[m
[32m+[m[32m  </head>[m
[32m+[m[32m  <body>[m
[32m+[m[32m    <div id="root"></div>[m
[32m+[m[32m    <script type="module" src="src\main.jsx"></script>[m
[32m+[m[32m  </body>[m
[32m+[m[32m</html>[m
[1mdiff --git a/03tailwindprops/package-lock.json b/03tailwindprops/package-lock.json[m
[1mnew file mode 100644[m
[1mindex 0000000..7628634[m
[1m--- /dev/null[m
[1m+++ b/03tailwindprops/package-lock.json[m
[36m@@ -0,0 +1,2793 @@[m
[32m+[m[32m{[m
[32m+[m[32m  "name": "03tailwindprops",[m
[32m+[m[32m  "version": "0.0.0",[m
[32m+[m[32m  "lockfileVersion": 3,[m
[32m+[m[32m  "requires": true,[m
[32m+[m[32m  "packages": {[m
[32m+[m[32m    "": {[m
[32m+[m[32m      "name": "03tailwindprops",[m
[32m+[m[32m      "version": "0.0.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@tailwindcss/vite": "^4.3.1",[m
[32m+[m[32m        "react": "^19.2.7",[m
[32m+[m[32m        "react-dom": "^19.2.7",[m
[32m+[m[32m        "tailwindcss": "^4.3.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "devDependencies": {[m
[32m+[m[32m        "@eslint/js": "^10.0.1",[m
[32m+[m[32m        "@types/react": "^19.2.17",[m
[32m+[m[32m        "@types/react-dom": "^19.2.3",[m
[32m+[m[32m        "@vitejs/plugin-react": "^6.0.2",[m
[32m+[m[32m        "autoprefixer": "^10.5.2",[m
[32m+[m[32m        "eslint": "^10.5.0",[m
[32m+[m[32m        "eslint-plugin-react-hooks": "^7.1.1",[m
[32m+[m[32m        "eslint-plugin-react-refresh": "^0.5.3",[m
[32m+[m[32m        "globals": "^17.6.0",[m
[32m+[m[32m        "postcss": "^8.5.15",[m
[32m+[m[32m        "vite": "^8.1.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/code-frame": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-Aup7aUOfpbAUg2ROOJN6Iw5f9DMBlzu0mIkm/malLQFN/YQgO48wCj0Kxa3sEHJvPVFg7siR+qRInwXd2qhQKw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-validator-identifier": "^7.29.7",[m
[32m+[m[32m        "js-tokens": "^4.0.0",[m
[32m+[m[32m        "picocolors": "^1.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/compat-data": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/compat-data/-/compat-data-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-locTkQyKvwIEgBzVrn8693ebc97F2U8ZHjbXwDXJ5Fn2TCpNwTlKcaKLkdHop5c/icOFE7qt7Q9JC5hnKNa6Gg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/core": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/core/-/core-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-RgHBCvtjbOK2gXSNBNIkNoEc9qoVEtau3hj8gEqKQuL3HZAibKarWFEI3Lfm6EYKkLalOh8eSrj9b+ch9H/VBA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/code-frame": "^7.29.7",[m
[32m+[m[32m        "@babel/generator": "^7.29.7",[m
[32m+[m[32m        "@babel/helper-compilation-targets": "^7.29.7",[m
[32m+[m[32m        "@babel/helper-module-transforms": "^7.29.7",[m
[32m+[m[32m        "@babel/helpers": "^7.29.7",[m
[32m+[m[32m        "@babel/parser": "^7.29.7",[m
[32m+[m[32m        "@babel/template": "^7.29.7",[m
[32m+[m[32m        "@babel/traverse": "^7.29.7",[m
[32m+[m[32m        "@babel/types": "^7.29.7",[m
[32m+[m[32m        "@jridgewell/remapping": "^2.3.5",[m
[32m+[m[32m        "convert-source-map": "^2.0.0",[m
[32m+[m[32m        "debug": "^4.1.0",[m
[32m+[m[32m        "gensync": "^1.0.0-beta.2",[m
[32m+[m[32m        "json5": "^2.2.3",[m
[32m+[m[32m        "semver": "^6.3.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/babel"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/generator": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/generator/-/generator-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-DkXD5OJQaAQIdZ1bt3UZdEnHAn9Imd3IVBdX03UFe+ony9Ojw5pzr9YVKGDY1jt+Gcn/FnGkNf8r+Vj5NOJWtQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/parser": "^7.29.7",[m
[32m+[m[32m        "@babel/types": "^7.29.7",[m
[32m+[m[32m        "@jridgewell/gen-mapping": "^0.3.12",[m
[32m+[m[32m        "@jridgewell/trace-mapping": "^0.3.28",[m
[32m+[m[32m        "jsesc": "^3.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-compilation-targets": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-compilation-targets/-/helper-compilation-targets-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-wem6WaBj4NaVYVdNhLPPVacES6ZJ+KBBfSkTMD3YZxbP3rm3Di85tJU5ljaUNhaOynt+Aj0xruhYuzQBt8n71g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/compat-data": "^7.29.7",[m
[32m+[m[32m        "@babel/helper-validator-option": "^7.29.7",[m
[32m+[m[32m        "browserslist": "^4.24.0",[m
[32m+[m[32m        "lru-cache": "^5.1.1",[m
[32m+[m[32m        "semver": "^6.3.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-globals": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-globals/-/helper-globals-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-3nQVUAtvkKH9zahfWgw96Jc/uFOmjACE1kQz82E2lqWmHBgjzbNlsC22nuQTfahmWeQtTq5nQ/4Nnd2A1wj4zA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-module-imports": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-module-imports/-/helper-module-imports-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-ejHwrQQYcm9xnTivShn2IDOlIzInN34AXskvq9QicvCtEzq1Vzclu/tKF8Jq1Cg8JG2GL6/EmjgsCT7lXepE3g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/traverse": "^7.29.7",[m
[32m+[m[32m        "@babel/types": "^7.29.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-module-transforms": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-module-transforms/-/helper-module-transforms-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-UPUVSyXbOh627KiCIGQSgwWzGeBKLkaJ9PJEdrngIwMSzxLR4jS4+f1f1jb7VzBbg8nFLaYotvVPFCTqdrmTAg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-module-imports": "^7.29.7",[m
[32m+[m[32m        "@babel/helper-validator-identifier": "^7.29.7",[m
[32m+[m[32m        "@babel/traverse": "^7.29.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@babel/core": "^7.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-string-parser": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-string-parser/-/helper-string-parser-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-Pb5ijPrZ89GDH8223L4UP8i6QApWxs04RbPQJTeWDV0/keR2E36MeKnyr6LYmUUvqRRI+Iv87SuF1W6ErINzYw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-validator-identifier": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-qehxGkRj55h/ff8EMaJ+cYhyaKlHIxqYDn682wQD7RNp9UujOQsHog2uS0r2vzr4pW+sXf90NeeayjcNaX3fFg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-validator-option": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-validator-option/-/helper-validator-option-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-N9ZErrD+yW5geCDtBqnOoxmR8+tNKiGuxKlDpuJxfsqpa2dFcexaziGAE/qoHLiDDreVNMupxGmSoNlyvsA3gw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helpers": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helpers/-/helpers-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-1k2lAGRMfHTcwuNYcCNUmaUffmQv8KWMfh2iJUUeRlwlwH4FdNG7mfPI10NPfLHJFThE4Tyr4mv7kTNZOiPuBg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/template": "^7.29.7",[m
[32m+[m[32m        "@babel/types": "^7.29.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/parser": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/parser/-/parser-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-hnORnjP/1P/zFEndoeX+n+t1RwWRJiJpM/jO7FW32Kn9r5+sJB2JWOdYo4L6k78j15eCwY3Gm/7364B1EMwtNg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/types": "^7.29.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "parser": "bin/babel-parser.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/template": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/template/-/template-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-puq+Gf35oI24FeN11LkoUQFqv9uwNeWpxXZi/Ji3rRIoKAzKnxRaZ+Gkj0vKS9ZCiTESfng1N9LyOyXvo+m+Gg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/code-frame": "^7.29.7",[m
[32m+[m[32m        "@babel/parser": "^7.29.7",[m
[32m+[m[32m        "@babel/types": "^7.29.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/traverse": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/traverse/-/traverse-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-EhlfNQtZ+NK22w5BM61ciuiq1m58ed33Wr1Xan//ZRTy6hgjnwyCffRYwzsGXdASJSUJ1guZILsErh1eQcl+zw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/code-frame": "^7.29.7",[m
[32m+[m[32m        "@babel/generator": "^7.29.7",[m
[32m+[m[32m        "@babel/helper-globals": "^7.29.7",[m
[32m+[m[32m        "@babel/parser": "^7.29.7",[m
[32m+[m[32m        "@babel/template": "^7.29.7",[m
[32m+[m[32m        "@babel/types": "^7.29.7",[m
[32m+[m[32m        "debug": "^4.3.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/types": {[m
[32m+[m[32m      "version": "7.29.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/types/-/types-7.29.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-4zBIxpPzowiZpusoFkyGVwakdRJUyuH5PxQ/PrqghfdFWWasvnCdPfQXHrenDai+gyLARulZjZowCOj6fjT4pA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-string-parser": "^7.29.7",[m
[32m+[m[32m        "@babel/helper-validator-identifier": "^7.29.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@emnapi/core": {[m
[32m+[m[32m      "version": "1.11.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@emnapi/core/-/core-1.11.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-RSvbQmHzdKzNsLYa/wHrbc3KN4sYLKAdPZxqiM2HATqv/SBk2/ENSHpvXGaLOMcsAyz0poEGqkmmKYG3OWiJEQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@emnapi/wasi-threads": "1.2.2",[m
[32m+[m[32m        "tslib": "^2.4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@emnapi/runtime": {[m
[32m+[m[32m      "version": "1.11.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@emnapi/runtime/-/runtime-1.11.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-vgj7R3y3Wgx24IQaGPA/R6YFXLHVMOZ0uVEyIQPaWs+rd1AzfEMXlAC22FYwO1XkKR6NPsq7mUandH8oIRdZFw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "tslib": "^2.4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@emnapi/wasi-threads": {[m
[32m+[m[32m      "version": "1.2.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@emnapi/wasi-threads/-/wasi-threads-1.2.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-c95qOXkHdydNKhscBTebqEC1CVAZpyqOfVfBzQ1qgzyl3gfeldUjIggDbIZgDKsHLgnsM+igH7TJ/eAasaVuMA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "tslib": "^2.4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@eslint-community/eslint-utils": {[m
[32m+[m[32m      "version": "4.9.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@eslint-community/eslint-utils/-/eslint-utils-4.9.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-phrYmNiYppR7znFEdqgfWHXR6NCkZEK7hwWDHZUjit/2/U0r6XvkDl0SYnoM51Hq7FhCGdLDT6zxCCOY1hexsQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "eslint-visitor-keys": "^3.4.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://opencollective.com/eslint"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "eslint": "^6.0.0 || ^7.0.0 || >=8.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@eslint-community/eslint-utils/node_modules/eslint-visitor-keys": {[m
[32m+[m[32m      "version": "3.4.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-wpc+LXeiyiisxPlEkUzU6svyS1frIO3Mgxj1fdy7Pm8Ygzguax2N3Fa/D/ag1WqbOprdI+uY6wMUl8/a2G+iag==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://opencollective.com/eslint"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@eslint-community/regexpp": {[m
[32m+[m[32m      "version": "4.12.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@eslint-community/regexpp/-/regexpp-4.12.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-EriSTlt5OC9/7SXkRSCAhfSxxoSUgBm33OH+IkwbdpgoqsSsUg7y3uh+IICI/Qg4BBWr3U2i39RpmycbxMq4ew==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.0.0 || ^14.0.0 || >=16.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@eslint/config-array": {[m
[32m+[m[32m      "version": "0.23.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@eslint/config-array/-/config-array-0.23.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-Y3kKLvC1dvTOT+oGlqNQ1XLqK6D1HU2YXPc52NmAlJZbMMWDzGYXMiPRJ8TYD39muD/OTjlZmNJ4ib7dvSrMBA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@eslint/object-schema": "^3.0.5",[m
[32m+[m[32m        "debug": "^4.3.1",[m
[32m+[m[32m        "minimatch": "^10.2.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || ^22.13.0 || >=24"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@eslint/config-helpers": {[m
[32m+[m[32m      "version": "0.6.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@eslint/config-helpers/-/config-helpers-0.6.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ii6Bw9jJ2zi2cWA2Z+9/QZ/+3DX6kwaV5Q986D/CdP3Lap3w/pgQZ373FV7byY/i7L4IRH/G43I5dz1ClsCbpA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@eslint/core": "^1.2.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || ^22.13.0 || >=24"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@eslint/core": {[m
[32m+[m[32m      "version": "1.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@eslint/core/-/core-1.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-MwcE1P+AZ4C6DWlpin/OmOA54mmIZ/+xZuJiQd4SyB29oAJjN30UW9wkKNptW2ctp4cEsvhlLY/CsQ1uoHDloQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/json-schema": "^7.0.15"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || ^22.13.0 || >=24"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@eslint/js": {[m
[32m+[m[32m      "version": "10.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@eslint/js/-/js-10.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-zeR9k5pd4gxjZ0abRoIaxdc7I3nDktoXZk2qOv9gCNWx3mVwEn32VRhyLaRsDiJjTs0xq/T8mfPtyuXu7GWBcA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || ^22.13.0 || >=24"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://eslint.org/donate"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "eslint": "^10.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "eslint": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@eslint/object-schema": {[m
[32m+[m[32m      "version": "3.0.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@eslint/object-schema/-/object-schema-3.0.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-vqTaUEgxzm+YDSdElad6PiRoX4t8VGDjCtt05zn4nU810UIx/uNEV7/lZJ6KwFThKZOzOxzXy48da+No7HZaMw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || ^22.13.0 || >=24"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@eslint/plugin-kit": {[m
[32m+[m[32m      "version": "0.7.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@eslint/plugin-kit/-/plugin-kit-0.7.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-+CNAzxglkrpNf/kKywqQfk74QjtceuOE7Qm+AF8miRvPF/wmmK5+OJOgVh3AVTT3RP2mH3+FOaxlE5v72owk0A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@eslint/core": "^1.2.1",[m
[32m+[m[32m        "levn": "^0.4.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || ^22.13.0 || >=24"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@humanfs/core": {[m
[32m+[m[32m      "version": "0.19.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@humanfs/core/-/core-0.19.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-UhXNm+CFMWcbChXywFwkmhqjs3PRCmcSa/hfBgLIb7oQ5HNb1wS0icWsGtSAUNgefHeI+eBrA8I1fxmbHsGdvA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@humanfs/types": "^0.15.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18.18.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@humanfs/node": {[m
[32m+[m[32m      "version": "0.16.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@humanfs/node/-/node-0.16.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-gE1eQNZ3R++kTzFUpdGlpmy8kDZD/MLyHqDwqjkVQI0JMdI1D51sy1H958PNXYkM2rAac7e5/CnIKZrHtPh3BQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@humanfs/core": "^0.19.2",[m
[32m+[m[32m        "@humanfs/types": "^0.15.0",[m
[32m+[m[32m        "@humanwhocodes/retry": "^0.4.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18.18.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@humanfs/types": {[m
[32m+[m[32m      "version": "0.15.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@humanfs/types/-/types-0.15.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZZ1w0aoQkwuUuC7Yf+7sdeaNfqQiiLcSRbfI08oAxqLtpXQr9AIVX7Ay7HLDuiLYAaFPu8oBYNq/QIi9URHJ3Q==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18.18.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@humanwhocodes/module-importer": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-bxveV4V8v5Yb4ncFTT3rPSgZBOpCkjfK0y4oVVVJwIuDVBRMDXrPyXRL988i5ap9m9bnyEEjWfm5WkBmtffLfA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=12.22"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/nzakas"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@humanwhocodes/retry": {[m
[32m+[m[32m      "version": "0.4.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@humanwhocodes/retry/-/retry-0.4.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-bV0Tgo9K4hfPCek+aMAn81RppFKv2ySDQeMoSZuvTASywNTnVJCArCZE2FWqpvIatKu7VMRLWlR1EazvVhDyhQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18.18"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/nzakas"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@jridgewell/gen-mapping": {[m
[32m+[m[32m      "version": "0.3.13",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@jridgewell/gen-mapping/-/gen-mapping-0.3.13.tgz",[m
[32m+[m[32m      "integrity": "sha512-2kkt/7niJ6MgEPxF0bYdQ6etZaA+fQvDcLKckhy1yIQOzaoKjBBjSj63/aLVjYE3qhRt5dvM+uUyfCg6UKCBbA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@jridgewell/sourcemap-codec": "^1.5.0",[m
[32m+[m[32m        "@jridgewell/trace-mapping": "^0.3.24"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@jridgewell/remapping": {[m
[32m+[m[32m      "version": "2.3.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@jridgewell/remapping/-/remapping-2.3.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-LI9u/+laYG4Ds1TDKSJW2YPrIlcVYOwi2fUC6xB43lueCjgxV4lffOCZCtYFiH6TNOX+tQKXx97T4IKHbhyHEQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@jridgewell/gen-mapping": "^0.3.5",[m
[32m+[m[32m        "@jridgewell/trace-mapping": "^0.3.24"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@jridgewell/resolve-uri": {[m
[32m+[m[32m      "version": "3.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@jridgewell/resolve-uri/-/resolve-uri-3.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-bRISgCIjP20/tbWSPWMEi54QVPRZExkuD9lJL+UIxUKtwVJA8wW1Trb1jMs1RFXo1CBTNZ/5hpC9QvmKWdopKw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@jridgewell/sourcemap-codec": {[m
[32m+[m[32m      "version": "1.5.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-cYQ9310grqxueWbl+WuIUIaiUaDcj7WOq5fVhEljNVgRfOUhY9fy2zTvfoqWsnebh8Sl70VScFbICvJnLKB0Og==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@jridgewell/trace-mapping": {[m
[32m+[m[32m      "version": "0.3.31",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@jridgewell/trace-mapping/-/trace-mapping-0.3.31.tgz",[m
[32m+[m[32m      "integrity": "sha512-zzNR+SdQSDJzc8joaeP8QQoCQr8NuYx2dIIytl1QeBEZHJ9uW6hebsrYgbz8hJwUQao3TWCMtmfV8Nu1twOLAw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@jridgewell/resolve-uri": "^3.1.0",[m
[32m+[m[32m        "@jridgewell/sourcemap-codec": "^1.4.14"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@napi-rs/wasm-runtime": {[m
[32m+[m[32m      "version": "1.1.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@napi-rs/wasm-runtime/-/wasm-runtime-1.1.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZLv/JdUfkvOy9eCnnBaGfiO+XimbjebAeO+MRQqD/B+FR1tnRN0tpKSJHRbE8sFfS6aqsXZ67TQjfwfsxULVbg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@tybys/wasm-util": "^0.10.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/Brooooooklyn"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@emnapi/core": "^1.7.1",[m
[32m+[m[32m        "@emnapi/runtime": "^1.7.1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@oxc-project/types": {[m
[32m+[m[32m      "version": "0.137.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@oxc-project/types/-/types-0.137.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-WT+Gb24i8hmvo85AIv2oEYouEXkRlKAlT9WaCa3TfLgNCN+GhrJOGZuIlMouAh38Qe4QOx26eUOVsq70qXrywA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/Boshen"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-android-arm64": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-android-arm64/-/binding-android-arm64-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-DT6Z3PhvioeHMvxo+xHc3KtqggrI7CCTXCmC2h/5zUlp5jVitv7XEy+9q5/7v8IolhlioawpMo8Kg0EEBy7J0g==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "android"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-darwin-arm64": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-darwin-arm64/-/binding-darwin-arm64-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-0NwgwsjM7LrsuVnXMK3koTpagBNOhloc/BNjKqZjv4V5zI5r13qx69uVhRx+o5Z0yy4Hzq+lpy7TAgUG/ocvrw==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "darwin"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-darwin-x64": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-darwin-x64/-/binding-darwin-x64-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-YtiBp4disu6V560loT6PjMdiRaWmVvDNrUunAalbiFx2ggeJwxdAsgZMcoGP17uyAsTwAj5V1niksxlHnVQ1Sw==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "darwin"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-freebsd-x64": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-freebsd-x64/-/binding-freebsd-x64-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-yD3EkEdXk2LypPxnf/kSZHirarsI8gcPzc62SukhR9VJTyvV+F9Q/GxWNuCojc7sXyuVC4DxRGhdDK4X8VSsbw==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "freebsd"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-linux-arm-gnueabihf": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-linux-arm-gnueabihf/-/binding-linux-arm-gnueabihf-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-c+8vieQbsD7HNAHKIA34w0GJ9FedFFuJGD+7E6vz7Q3uqAIugL5p45fhlsj4UaAsHpcmlqugBWMhA0/j7o0sIg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-linux-arm64-gnu": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-linux-arm64-gnu/-/binding-linux-arm64-gnu-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-50jD0uUwLvur7Zz9LHz17kaAdTPjn5wN93hEgjvmYFRZwiR7ZJYovTd5ipyWJDAnXKvZ+wgc+/Ika6dwSF5OcA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "libc": [[m
[32m+[m[32m        "glibc"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-linux-arm64-musl": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-linux-arm64-musl/-/binding-linux-arm64-musl-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-BO9+oPL8K9poZJBfYPsXNtYjPE5uM3qeehT3aFcW4LITOl+iSqhp0abzjR2nWBUNjIZeKXjAEWBZ64WjNoHd6w==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "libc": [[m
[32m+[m[32m        "musl"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-linux-ppc64-gnu": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-linux-ppc64-gnu/-/binding-linux-ppc64-gnu-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-f3VpLB1vQ0Eo6ecr/6cekLnvYMFF4YBFoVGkfkvPLq1bAkbAwHYQPZKoAmG6OJyTcxxoC+AvezGx/S1obNC0Mw==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "ppc64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "libc": [[m
[32m+[m[32m        "glibc"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-linux-s390x-gnu": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-linux-s390x-gnu/-/binding-linux-s390x-gnu-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-AmurZ26Pqx/RI9N1gzEOCklkKXl927yjfXWUUS0O7Puh8ARM/Ob8qfrD3qnWksScdw6cSrW5PSHE9DyLu7+PtA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "s390x"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "libc": [[m
[32m+[m[32m        "glibc"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-linux-x64-gnu": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-linux-x64-gnu/-/binding-linux-x64-gnu-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-JJpqs8bRGITDOdbkNKnlojzBabbOHrqjSvDr0IVsZObE1lBcPjxItUEY9eWIDbxaJ3cGrXPWGfGkIxFijg/URg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "libc": [[m
[32m+[m[32m        "glibc"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-linux-x64-musl": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-linux-x64-musl/-/binding-linux-x64-musl-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-rSJcdjPxzA/by/6/rYs+v+bXU7UjvnbUWz8MJb6kh6+knqB1dCrtHg0uu7C/4haqJvqdkYHQ5IGn+tCH9GLW/g==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "libc": [[m
[32m+[m[32m        "musl"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-openharmony-arm64": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-openharmony-arm64/-/binding-openharmony-arm64-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-hQ3/PYkDJICgevvyNcVrihVeqq7k1Pp3VZ9lY+dauAYUJKO+auqApvANhvR1An9BhmqYKvW2Mu1F9u4DXSMLxQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "openharmony"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-wasm32-wasi": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-wasm32-wasi/-/binding-wasm32-wasi-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-Elcv/BtML9lXrV6JuKITc/grN2kYV9gjsQpW8Jfw4ioK0TOkjBjye0nnyqQNy9STNaI20lXNaQBRrD5gSgR0Yg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "wasm32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@emnapi/core": "1.11.1",[m
[32m+[m[32m        "@emnapi/runtime": "1.11.1",[m
[32m+[m[32m        "@napi-rs/wasm-runtime": "^1.1.6"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-win32-arm64-msvc": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-win32-arm64-msvc/-/binding-win32-arm64-msvc-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-2DrEfhluH9yhiaFApmsjsjwrSYbNcY1oFTzYSP1a535jDbV98zCFanA/96TBUd0iDFcxGmw9QRExwGCXz3U+/g==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "win32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/binding-win32-x64-msvc": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/binding-win32-x64-msvc/-/binding-win32-x64-msvc-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-OL4OMk7UPXOeVGGd3qo5zJyPIljf4AFgk5QAkPPS+OoLuOOozhuaQGC18MxVTnw/06q93gShAJzlwnSCY9YtqA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "win32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^20.19.0 || >=22.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rolldown/pluginutils": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rolldown/pluginutils/-/pluginutils-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-2j9bGt5Jh8hj+vPtgzPtl72j0yRxHAyumoo6TNfAjsLB04UtpSvPbPcDcBMxz7n+9CYB0c1GxQFxYRg2jimqGw==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/node": {[m
[32m+[m[32m      "version": "4.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/node/-/node-4.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-6NDaqRoAMSXD1mr/RXu0HBvNE9a2n5tHPsxu9XHLws8o4Twes5rBM2205SUUiJ9goAtadrN6xTGX0UDEwp/N4A==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@jridgewell/remapping": "^2.3.5",[m
[32m+[m[32m        "enhanced-resolve": "5.21.6",[m
[32m+[m[32m        "jiti": "^2.7.0",[m
[32m+[m[32m        "lightningcss": "1.32.0",[m
[32m+[m[32m        "magic-string": "^0.30.21",[m
[32m+[m[32m        "source-map-js": "^1.2.1",[m
[32m+[m[32m        "tailwindcss": "4.3.1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/node/node_modules/jiti": {[m
[32m+[m[32m      "version": "2.7.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/jiti/-/jiti-2.7.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-AC/7JofJvZGrrneWNaEnJeOLUx+JlGt7tNa0wZiRPT4MY1wmfKjt2+6O2p2uz2+skll8OZZmJMNqeke7kKbNgQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "jiti": "lib/jiti-cli.mjs"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/oxide": {[m
[32m+[m[32m      "version": "4.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide/-/oxide-4.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-yVPyo8RNkabVr3O2EhHEE0Rewu7YKzc1DhIqfL46LKveFrmu9XbDazNOJY7/GRuvw1h6u3utWnR29H/p5JPlgA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 20"[m
[32m+[m[32m      },[m
[32m+[m[32m      "optionalDependencies": {[m
[32m+[m[32m        "@tailwindcss/oxide-android-arm64": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-darwin-arm64": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-darwin-x64": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-freebsd-x64": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-linux-arm-gnueabihf": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-linux-arm64-gnu": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-linux-arm64-musl": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-linux-x64-gnu": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-linux-x64-musl": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-wasm32-wasi": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-win32-arm64-msvc": "4.3.1",[m
[32m+[m[32m        "@tailwindcss/oxide-win32-x64-msvc": "4.3.1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/oxide-android-arm64": {[m
[32m+[m[32m      "version": "4.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-android-arm64/-/oxide-android-arm64-4.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-SVlyf61g374l5cHyg8x9kf5xmLcOaxvOTsbsqDnSsDJaKOEFZ7GCvi84VAVGpxojYOs1+3K6M0UjXfqPU8vmOQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "android"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 20"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/oxide-darwin-arm64": {[m
[32m+[m[32m      "version": "4.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-darwin-arm64/-/oxide-darwin-arm64-4.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-hVnWLwv+e/l7c4WKyVtHVrIPvYdqWHjRB3MDIqARynzFtnQg85kmQEFCbV9Ja0VVx4xXTIiDWY60Y7iz/iNoDA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "darwin"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 20"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/oxide-darwin-x64": {[m
[32m+[m[32m      "version": "4.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-darwin-x64/-/oxide-darwin-x64-4.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-Cf7abu0WVgbhU7ANgPUnSAvm7nCvMweusHb8FnaHlLfv/Caq4GYaEZg7ZImzzmjx4lIAfuS8q+eLIS7A7IzxIg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "darwin"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 20"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/oxide-freebsd-x64": {[m
[32m+[m[32m      "version": "4.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-freebsd-x64/-/oxide-freebsd-x64-4.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZZqzX2Y+GXtXXfqSfpJhDm60OoZfvLHLCgm+J7NVqgHHJjG/m9ugZI77RwTsVd4fnBJuCFP6Ae6kTJb71UdS8g==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "freebsd"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 20"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/oxide-linux-arm-gnueabihf": {[m
[32m+[m[32m      "version": "4.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-arm-gnueabihf/-/oxide-linux-arm-gnueabihf-4.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-/Ah/xik0LaMYfv9DZ0S/t4pBlBNYOcqtRwusjgovHkvT8ixueWCLyJjsaF5kQIckjb4IT8Q6K6p/iPmZMixYgg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 20"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/oxide-linux-arm64-gnu": {[m
[32m+[m[32m      "version": "4.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-arm64-gnu/-/oxide-linux-arm64-gnu-4.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-gqdFoVJlw444GvpnheZLHmvTzSxI/cOUUh2KSNejQjTcYkW062SVD+En0rUgD+QV91bz1XGIGtt1HJd48xUGbQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "libc": [[m
[32m+[m[32m        "glibc"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 20"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/oxide-linux-arm64-musl": {[m
[32m+[m[32m      "version": "4.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-arm64-musl/-/oxide-linux-arm64-musl-4.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-Bwv9KwOvE0VKa86xPFif9b9c3Y1NxOV1P0gLti/IYaWEsQYZXDlxfGEtA8mdDZ7SG3wyNXAWYT5SIn3giL57oA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "libc": [[m
[32m+[m[32m        "musl"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 20"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/oxide-linux-x64-gnu": {[m
[32m+[m[32m      "version": "4.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-x64-gnu/-/oxide-linux-x64-gnu-4.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-Ymi8O8T15HYQdOUWUtTI6ldN0neHP85FC+Qz32xTcZ7iJXtem/x8ITev0o1e9e5rkqj4lONZfTRLvkmin1+tKg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "libc": [[m
[32m+[m[32m        "glibc"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 20"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[3