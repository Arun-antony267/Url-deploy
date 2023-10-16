import React from "react";
import ReactDOM from 'react-dom'


function Appl(){
    return(
        <div className="button">
        <a href="/user/create">
              <button class="btn btn-outline-success" type="button">Create</button>
              </a>
              </div>
    )
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <Appl/>,
      document.getElementById('button')
    )
    })