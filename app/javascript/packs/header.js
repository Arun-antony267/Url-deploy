import React from 'react';


function Header() {
    return (
      <><div className="navbar" >

        <h1>URL Shortener</h1>
        
        <div >
          <a href="/">
            <button class="btn btn-outline-success" type="button">Home</button>
          </a>
          <a href="/user/login">
            <button class="btn btn-outline-success" type="button">Login</button>
          </a>
          <a href="/user/signup">
            <button class="btn btn-outline-success" type="button">Signup</button>
          </a>
        </div>
       
  
        <div class="dropdown">
 
        <span class="navbar-toggler-icon"></span>
  <div class="dropdown-content" >
  <a href="/home/view">
              <button class="btn btn-outline-success" type="button">List Of URL's Shortened</button>
              </a>
              <a href="/user/users">
              <button class="btn btn-outline-success" type="button">List Of Users</button>
              </a>
  </div>

</div>

      </div>
     
   </>
      
    );
  }

  export default Header;