import React from 'react';


function Component() {
    return (
      <div className="navbar" >

        <h1>URL Shortener</h1>
        
        <div >
          <a href="/">
            <button class="btn btn-outline-primary" type="button">Home</button>
          </a>
        </div>
       
  
        <div class="dropdown">
        <a href="/">
            <button class="btn btn-outline-primary" type="button">Logout</button>
          </a>
        </div>
      </div>
     
      
    );
  }

  export default Component;