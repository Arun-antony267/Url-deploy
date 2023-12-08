import React from "react";

function Header() {
  return (
    <>
      <div className="topnav">
        <h1>URL Shortener</h1>

        <div>
          <a href="/home/new">
            <button class="dropbtn dropbtn-outline-primary" type="button">
              Create a new Link
            </button>
          </a>
        </div>

        <div class="dropdown">
          <a href="/home/index">
            <button class="btn btn-outline-primary" type="button">
              Home
            </button>
          </a>
        </div>
      </div>
    </>
  );
}

export default Header;
