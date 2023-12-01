import React, { useState } from "react";


const Login = () => {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
  
    const handleLogin = () => {
      // Add your login validation logic here
      // For simplicity, let's just log the email and password for demonstration purposes
      console.log("Email:", email);
      console.log("Password:", password);
    };
    return(
        <div className="p-1">
        <h2>Login</h2>
        <form>
          <input
            type="text"
            placeholder="Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <br />
          <input
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          <br />
          <button type="button" onClick={handleLogin}>
            Login
          </button>
        </form>
      </div>
    );
  };
  

export default Login;