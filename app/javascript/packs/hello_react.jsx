// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import Header from './header';
import Body from './body';

function App() {
  return (
    <div className="app">
      <Header />
    </div>
  );
}

function App1(){
  return(
    <div className='app1'>

    <Body/>

    </div>
  )
}


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App/>,
    document.getElementById('content'),
  )
})

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App1 />,
    document.getElementById('body'),
  )
})


