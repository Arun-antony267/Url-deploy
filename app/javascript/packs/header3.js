import React from 'react';

function Header3() {
  return (
    <div className="topnav">
      <h1>
        <a href='/' style={{ textDecoration: 'none', color: 'black' }}>
          URL Shortener
        </a>
      </h1>

      {/* <div class="dropdown">
        <a href="/user/login">
          <button class="btn btn-outline-primary" type="button"> Home</button>
        </a>
      </div> */}
    </div>
  );
}

export default Header3;
