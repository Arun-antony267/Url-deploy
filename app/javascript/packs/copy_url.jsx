import React from "react";
import ReactDOM from 'react-dom'
import Copyurl from "./copy";

function UrlCopy(){
    return(
        <div className="copy">
            <Copyurl/>
        </div>
    )
}


document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <UrlCopy/>,
      document.getElementById('copy')
    )
    })