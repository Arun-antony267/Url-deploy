// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import Header from './header';
import Component from './header1';
import Loading from './loading';


function Page(){
  return(
    <div className='loading'>
      <Loading/>
    </div>
  )
}


function App() {
  return (
    <div className="app">
      <Header />
    </div>
  );
}

function Logout(){
  return(
    <div className="app1">
      <Component/>
    </div>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Page/>,
    document.getElementById('loading'),
  )
})



document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App/>,
    document.getElementById('header1'),
  )
})

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Logout />,
    document.getElementById('header2'),
  )
})


