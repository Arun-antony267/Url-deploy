import React from 'react';
import { useState, useEffect } from 'react';
import CopyToClipboard from 'react-copy-to-clipboard';


function Display(){
//  const text="Hi this is react body"

const url="/filesrturl"
const [text, setText]= useState('')

const url2="/fileogurl"
const [text2, setText2]= useState('')

const fetchInfo = () => {
  return fetch(url)
  .then ((res) => res.json())
  .then((d) => setText(d))
}

useEffect(() => {
  fetchInfo();
});

const fetchInfo2 = () => {
    return fetch(url2)
    .then ((res) => res.json())
    .then((d) => setText2(d))
  }
  useEffect(() => {
    fetchInfo2();
  });

function handleCopy(){
  const copyText=navigator.clipboard.writeText(text)
  alert("Copied Successfully")
}

return (
  <div className='p-1 '>
      <div className='box-1'>
<div className='container'>
  The Original URL is:<input type="text" name="name" value={text2} />
    The Shortened URL is :<input type="text" name="name" value={text} />
    <button class="btn btn-outline-primary" onClick={handleCopy}>Copy</button>
    <a href="/pdf/new_line">
        <button class="btn btn-outline-primary" type="button">Next</button>
        </a>
</div>
</div>
</div>
)
}

export default Display