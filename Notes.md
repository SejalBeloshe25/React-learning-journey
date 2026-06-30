:------------: Lecture 1 : ROADMAP OF REACT :------------:

1. React makes easy to manage & build UI.
2. Why react was created ?
to overcome Phantom (ghost) message problem
3. In-depth concepts : Bable, fibre, virtual DOM, Diff algorithm, hydration
4. React is a library
5. Topics to learn : 
    core of react (statae or UI manipulation , JSX)
    Component Reusability
    Reusing of component (Props)
    How to propagate change (Hooks)
    Single Page Application (SPA)

6. Additional Addon to React
    1. router (react don't have router)
    2. State management (react don't have state management)
        Redax, Redux, toolkit, zustand, context API
    3. class based component
        legacy code
    4. Backend as a Service (BAAS)
    5. After React
        react is not a complete solution in most case. 
            No SEO, browser render of JS, No routing
        Framework
            Next JS, Gatsby, Remix

:-----------: Lecture 2 : understand about react projects  :-----------:

:-----------: Lecture 3 : The Flow and Structure of react projects  :-----------:

Function and file name must be capitalize
vite library file force to store the file with .jsx

Commands : 
1. node -v : to check whether we installed node.js or not, if yes then what's the version we installed.

2. npm -v :(pakage manager) if npm installed or not , it's version 
3. npx -v : used to mention various commands that are available in different modules

4. npx create-react-app. : inbuit command to create basic boiler plate code to start the project

5. npm start : react application will start

6. npx tsc --init : Creates a new tsconfig.json                                         

7. npx tsc : compiles typescript file into javascript 

8. node dist/index.js : runs the file and shows output . use it after compilation command (npx tsc)

9. npx create-react-app 01basicreact : creates a basic structure of a project   - takes a lot time & too bulky , so there are options for this like vite

10. npm run start : opens the file in browser and runs the code 

11. npm run build : creates a new build folder with subfolders

12. npm run dev : to run the project created using vite library

13. npm create vite@latest : to create a vite project : 01vitereact - react - javascript 

14. ls : to see the current path

15. cd .. : to go back 1 step in term of path of files
ex. /workspaces/React-learning-journey/01vitereact
after cd .. command : /workspaces/React-learning-journey


:-----------: Lecture 4 : Create react library and JSX  :-----------:

REACT uses bundlers as vite or other 

:-----------: Lecture 5 : Why we need Hooks and Project :-----------:

main file is main.jsx where app loads.
React reacts on variable updation.

Every hook has special job for specific task.


:-----------: Lecture 6 : Virtual DOM, Fibre and reconciliation :-----------:

React fibre architecture -  

REACT uses bundlers as vite or other 

Reconciliation : 
the algorithm react uses to diff one tree with another to determine which pars need to be changed

update : 
A change in the data used to render a react app.usually the result of setState. Eventually results in a re-render

reconciliation is the algorithm behind what is popularly understood as the "Virtual DOM"

Fibre : 
fibres are a much lower level abstraction than application developers typically think about. 

:-----------: Lecture 7 : Tailwind and Props in React JS:-----------:

Pexels : website to get free images.
Devui.io : 

:-----------: Lecture 8 :A react interview question on counter :-----------:

:-----------: Lecture 9 : Building a react project :-----------:

:-----------: Lecture 10 : useEffect, useRef and useCallback with 1 project :-----------:
