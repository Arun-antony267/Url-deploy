import React from "react";

function Header() {
  return (
    <>
      <div className="topnav">
        <h1>URL Shortener</h1>

        <div class="dropdown">
        <button class="dropbtn">Reports</button>
        <div class="dropdown-content">
          <a href="/home/view">
            <button class="btn btn-outline-primary" type="button">
              List Of URL's Shortened
            </button>
          </a>
          <a href="/user/users">
            <button class="btn btn-outline-primary" type="button">
              List Of Users
            </button>
          </a>
        </div>
      </div>
        <div>
        <a href="/home/next">
              <button class="btn btn-outline-primary" type="button">Next Short Url</button>
              </a>
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
