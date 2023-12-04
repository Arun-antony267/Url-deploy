import React from 'react';

// function Header4(){
//   return (
//     <div className="topnav" >

//     <h1>URL Shortener</h1>
    
//     <div class="dropdown">
// <a href="/user/login">
//           <button class="btn btn-outline-primary" type="button"> Home</button>
//           </a>
// </div>
// </div>
//   )
// }

function Header3() {
  
    return (
    
      <div className="topnav" >

        <h1>URL Shortener</h1>
        
        <div class="dropdown">
  <a href="/user/login">
              <button class="btn btn-outline-primary" type="button"> Home</button>
              </a>
  </div>
</div>
      
    );
  }

  // function HeaderApp(){
  //   return(
  //     <div>
  //     <Header3 />
  //     <Header4 />
  //   </div>
  //   )
  // }

  export default Header3;