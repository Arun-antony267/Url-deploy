import React from "react";
import ReactDOM from 'react-dom'
import MyComponent from "./count";


function UrlCount(){
    return(
      <div className='count'>
        <MyComponent/>
      </div>
    )
  }

  document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <UrlCount/>,
      document.getElementById('count')
    )
    })