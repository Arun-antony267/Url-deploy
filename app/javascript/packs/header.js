import React from 'react';

function Header() {
    return (
      <><div className="topnav" >

        <h1>URL Shortener</h1>
        
        <div >
          <a href="/">
            <button class="dropbtn dropbtn-outline-primary" type="button">Home</button>
          </a>
          <a href="/user/login">
            <button class="dropbtn dropbtn-outline-primary" type="button">Login</button>
          </a>
          <a href="/user/signup">
            <button class="dropbtn dropbtn-outline-primary" type="button">Signup</button>
          </a>
        </div>
       
  
        <div class="dropdown">
 
        <button class="dropbtn">Reports</button>
  <div class="dropdown-content" >
  <a href="/home/view">
              <button class="btn btn-outline-primary" type="button">List Of URL's Shortened</button>
              </a>
              <a href="/user/users">
              <button class="btn btn-outline-primary" type="button">List Of Users</button>
              </a>
  </div>

</div>

      </div>
     
   </>
      
    );
  }

  export default Header;