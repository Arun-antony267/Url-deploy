import React from "react";
import ReactDOM from "react-dom";
import Header3 from "./header3";

function Header() {
  return (
    <div className="count">
      <Header3 />
    </div>
  );
}

function Header4() {
  return (
    <div className="topnav ">
      <h1>
        <a href='/home/index' style={{ textDecoration: 'none', color: 'white' }} >
          URL Shortener
        </a>
      </h1>


      <div class="dropdown">
        <button class="btn btn-outline-primary">Reports</button>
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
        <a href="/">
          <button class="btn btn-outline-primary" type="button">
            Logout
          </button>
        </a>
      </div>
    </div>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Header4 />, document.getElementById("header4"));
});

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Header />, document.getElementById("header3"));
});
