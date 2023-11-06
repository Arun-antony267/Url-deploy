import React from "react";
import ReactDOM from 'react-dom'
import Component from "./header_logout";

function Logout(){
    return(
      <div className="header">
        <Component/>
      </div>
    )
  }

  document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <Logout />,
      document.getElementById('new'),
    )
  })
    
