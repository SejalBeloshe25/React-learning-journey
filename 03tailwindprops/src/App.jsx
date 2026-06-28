import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import Card from './components/card'
import './App.css'

function App() {
  const [count, setCount] = useState(0)
  let myObj = {
    username: "sejal",
    age:20
  }

  return ( 
  <>
    <h1 className='bg-green-400 text-black p-4 rounded-xl md-4  bg-black' >Tailwind Test </h1>
    <Card username="chaiaurcode" btnText="click me" />
    <Card username="hitesh" btnText="visit me" /> 

  </>
  )
}

export default App
