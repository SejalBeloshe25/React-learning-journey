import React from 'react'

function Card({username , btnText = "visit me"}) {
    console.log(username);
    
  return (
    <div className='relative h-100 w-75 rounded-md'>
    <img 
        src='https://static.vecteezy.com/system/resources/thumbnails/036/230/794/small_2x/ai-generated-vibrant-raindrop-sphere-reflects-nature-beauty-in-abstract-free-photo.jpg'
        alt='AirMax Pro'
        className="z-0 h-full w-full rounded-md object-cover"
        />
    <div className="absolute inset-0 bg-gradient-to from-gray-900 to-transparent"></div>
    <div className="absolute bottom-4 left-4 text-left">
        <h1 className="text-lg font-semibold text-white">{username}</h1>
        <p className="mt-2 text-sm text-gray-300">
            lorem ipsum dolor aso wef twqeww evewgw wdsc ascdfq3 2trtr ? 
        </p>
        <button className="mt-2 inline-flex cursor-pointeritems-center text-sm font-semibold text-white">
            {btnText}
        </button>
    </div>
    </div>

  )
}

export default Card                  