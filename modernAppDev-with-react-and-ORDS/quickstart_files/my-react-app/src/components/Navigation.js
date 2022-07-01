import React from 'react';
import cobra from '../images/cobra.png'
import { Link } from 'react-router-dom'; const Navigation = () => {
    return (
        <nav className="header d-flex flex-wrap justify-content-center border-bottom">
            <img src={cobra} alt="Cobra Notes" />
            <span className="d-flex align-items-center mb-md-0 me-md-auto text-dark text-decoration-none title">Cobra Notes</span>
            <ul className="nav nav-pills">
                <li className="nav-item">
                    <Link to="/" className="nav-link active">Home</Link>
                </li>
                <li  className="nav-item">
                    <Link to="/form" className="nav-link myorders">Create Note</Link>
                </li>
            </ul>
        </nav>
    );
};
export default Navigation;