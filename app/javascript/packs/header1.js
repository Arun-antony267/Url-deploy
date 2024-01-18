import React from "react";

function Component() {
  return (
    <div className="topnav">
      <h1>
        <a
          href="/home/index"
          style={{ textDecoration: "none", color: "white" }}
        >
          URL Shortener
        </a>
      </h1>
      <div class="con-right">
      <a href="/home/index">
          <button class="btn btn-outline-primary" type="button">
            Home
          </button>
        </a>
        <div class="dropdown">
          <button class="btn btn-outline-primary">Create New Link</button>

          <div class="dropdown-content">
            <a href="/home/new">
              <button class="btn btn-outline-primary" type="button">
                Single OR Multiple Url
              </button>
            </a>

            <a href="/file/upload">
              <button class="btn btn-outline-primary" type="button">
                File Upload
              </button>
            </a>
          </div>
        </div>
        <a href="/home/qr_code">
            <button class="btn btn-outline-primary" type="button">Generate QR</button>
          </a>
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
        <a href="/user/details">
            <button class="btn btn-outline-primary" type="button">
              User Details 
            </button>
          </a>
          <a href="/home/about">
            <button class="btn btn-outline-primary" type="button">
              About
            </button>
          </a>
      </div>
    </div>

  );
}

export default Component;
