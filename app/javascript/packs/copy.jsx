import React from "react";
import ReactDOM from 'react-dom'
import Copy from "./copy";

function UrlCopy(){
    return(
        <div className="copy">
            <Copy/>
        </div>
    )
}


document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <UrlCopyrlCopy/>,
      document.getElementById('count')
    )
    })