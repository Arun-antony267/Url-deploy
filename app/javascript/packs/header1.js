import React from "react";

function Component() {
  return (
    <div className="topnav">
      <h1>
        <a
          href="/home/index"
          style={{ textDecoration: "none", color: "black" }}
        >
          URL Shortener
        </a>
      </h1>

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
      <div class="dropdown">
        <a href="/home/index">
          <button class="btn btn-outline-primary" type="button">
            Home
          </button>
        </a>
      </div>
    </div>
  );
}

export default Component;
