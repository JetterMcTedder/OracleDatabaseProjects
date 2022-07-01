import React from 'react';
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Link
} from "react-router-dom";

import Layout from './Layout';
import Home from './home';
import Form from './form';
const Webpages = () => {
    return(
        <Router><Layout/><Routes>
            <Route exact path="/" element = {<Home />} />
            <Route path = "/form" element = {<Form />} />
        </Routes></Router>
    );
};export default Webpages;
