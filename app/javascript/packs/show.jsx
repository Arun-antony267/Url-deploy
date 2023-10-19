import React from "react";
import ReactDOM from 'react-dom'
import Display from "./file";

function Url(){
    return(
        <div className="copy">
            <Display/>
        </div>
    )
}


document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <Url/>,
      document.getElementById('file_show')
    )
    })