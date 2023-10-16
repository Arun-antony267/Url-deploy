// import React from "react"
// import PropTypes from "prop-types"
// class HelloWorld extends React.Component {
//   render () {
//     return (
//       <React.Fragment>
//         Greeting: {this.props.greeting}
//       </React.Fragment>
//     );
//   }
// }

// HelloWorld.propTypes = {
//   greeting: PropTypes.string
// };
// export default HelloWorld


// Path : app/javascript/components/GreetUser.js
import React from "react";
import PropTypes from "prop-types";

class GreetUser extends React.Component {
  render () {
    return (
      <div>
        <h1>Hello </h1>

        <h3>Wow! This is your first react component!</h3>
      </div>
    );
  }
}


export default GreetUser;
