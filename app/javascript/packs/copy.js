import React, { useState, useEffect } from 'react';
import CopyToClipboard from 'react-copy-to-clipboard';

function Copy(){
// const text="Hi this is react body"

const url="http://127.0.0.1:3000/srtUrl"
const [text, setText]= useState('')

const fetchInfo = () => {
  return fetch(url)
  .then ((res) => res.json())
  .then((d) => setText(d))
}

useEffect(() => {
  fetchInfo();
});

function handleCopy(){
  const copyText=navigator.clipboard.writeText(text)
  alert("Copied Successfully")
}

    return (
      <div className='container'>
          The Shortened Url is :<input type="text" name="name" value={text} />
          <button onClick={handleCopy}>Copy</button>
      </div>
  )
}

export default Copy