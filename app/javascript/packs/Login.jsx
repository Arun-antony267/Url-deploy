import React from "react";
import ReactDOM from 'react-dom'
import Login from "./login";


function LoginComponent(){
    return(
      <div className='container'>
        <Login/>
      </div>
    )
  }

  document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <LoginComponent/>,
      document.getElementById('login')
    )
    })