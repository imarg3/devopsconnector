import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

/* React StrictMode is a feature added in version 16.3 and aimed to help us 
 in finding potential problems in an application. Like Fragment, StrictMode does not render any UI, it only activates checks and adds warnings at runtime.
 */
ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
