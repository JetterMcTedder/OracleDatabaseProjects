import React, { useState, useEffect } from "react";
import './App.css';
import Webpages from './components';

function App() {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);

  return (
<React.Fragment>
	  <Webpages />	  
	  </React.Fragment>
  );
}

export default App;
