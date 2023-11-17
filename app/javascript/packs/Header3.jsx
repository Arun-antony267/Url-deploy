import React from "react";
import ReactDOM from 'react-dom'
import Header3 from "./header3";


function Header(){
    return(
      <div className='count'>
        <Header3/>
      </div>
    )
  }

  document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <Header/>,
      document.getElementById('header3')
    )
    })