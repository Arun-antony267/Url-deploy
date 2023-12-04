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

function Header4(){
  return (
    <div className="topnav" >

    <h1>URL Shortener</h1>
    
    <div class="dropdown">
<a href="/user/login">
          <button class="btn btn-outline-primary" type="button"> Logout</button>
          </a>
</div>
</div>
  )
}

  document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <Header4/>,
        document.getElementById('header4')
      )
      })

  document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <Header/>,
      document.getElementById('header3')
    )
    })