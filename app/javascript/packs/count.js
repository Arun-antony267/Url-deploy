import React, { useEffect, useState } from 'react';

function MyComponent(){
  
  const url= "home/urlCount";
  const [data, setData] = useState();
  
  const fetchInfo = () => {
    return fetch(url)
    .then ((res) => res.json())
    .then((d) => setData(d))
  }

  useEffect(() => {
    fetchInfo();
  });

  return(
      <div className='p'>
        <div className='box box-outline '>
        <p> The Number Of URL's Shortened is : {data}</p>
        </div>
      </div>
  )
}
export default MyComponent;