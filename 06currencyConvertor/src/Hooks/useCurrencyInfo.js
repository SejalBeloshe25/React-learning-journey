import {useEffect , useState} from "react"

function useCurrencyInfo(currency) {
    const[data, setData] = useState({})

    useEffect(() => {
         fetch(`https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@2026-07-01/v1/currencies/usd.min.json`)
        .then((res) => res.json())
        .then((res) => setData(res[currency]))
        console.log(data)
    },[currency])

    console.log(data);
    return data
    
}

export default useCurrencyInfo;