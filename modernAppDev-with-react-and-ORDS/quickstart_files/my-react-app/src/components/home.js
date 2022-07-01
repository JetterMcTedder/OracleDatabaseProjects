import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

const Home = () => {

    const [search, setSearch] = useState('');
    const [loading, setLoading] = useState(true);
    const [searchResults, setSearchResults] = useState([]);
    const [message, setMessage] = useState("");

    useEffect(() => {
        document.title = 'Home';
        const fetchStartingResults = async () => {
            const { REACT_APP_ORDS_ENDPOINT } = process.env;
            const response = await fetch(
                `${REACT_APP_ORDS_ENDPOINT}/ords/admin/notes/`
            );

            const searchResultsData = await response.json();
            setSearchResults(searchResultsData.items);
            setLoading(false);

        };
        fetchStartingResults();
    }, []);

    const handleChange = (e) => {
        setSearch(e.target.value);
    }

    const getData = () => {
        const refetchResults = async () => {
            const { REACT_APP_ORDS_ENDPOINT } = process.env;
            const response = await fetch(
                `${REACT_APP_ORDS_ENDPOINT}/ords/admin/notes/`
            );

            const searchResultsData = await response.json();
            setSearchResults(searchResultsData.items);
            setLoading(false);
        }
        refetchResults();
    }

    const handleDelete = (id) => {

        if (id) {

            const deleteResults = async () => {
                const { REACT_APP_ORDS_ENDPOINT } = process.env;
                const response = await fetch(
                    `${REACT_APP_ORDS_ENDPOINT}/ords/admin/notes/delete/${id}`
                    , {
                        method: "DELETE"
                    });

                if (response.status === 200) {
                    getData();
                    setSearch('');
                    setMessage("Note deleted successfully");
                } else {
                    setMessage("An error occured");
                }

            };
            deleteResults();
        }
    };

    const handleClick = (e) => {
        if (search.length > 0) {

            const fetchResults = async () => {
                const { REACT_APP_ORDS_ENDPOINT } = process.env;
                const response = await fetch(
                    `${REACT_APP_ORDS_ENDPOINT}/ords/admin/notes/search/${search}`
                );

                const searchResultsData = await response.json();
                setSearchResults(searchResultsData.items);
                setLoading(false);
            };
            fetchResults();

            e.preventDefault();
        } else {

            getData();
        }
    };

    return (
        <div className="main">
            <div className="createButtonHome">
                <ul className="nav nav-pills">
                    <li className="nav-item">
                        <Link to="/form" className="nav-link myorders">Create Note</Link>
                    </li>
                </ul>
            </div>
            <div className="message">{message ? <p>{message}</p> : null}</div>
            <pre>
                <div className="formDiv">
                    <label className="header1">Search:</label>
                    <input type="text" name="search" value={search} onChange={handleChange} />
                    <input className="submitButtonSearch" type="submit" value="Submit" onClick={handleClick} />
                </div>
            </pre>
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>Note</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    {loading ? "loading..." : <tbody>
                        {searchResults.map((searchResult) => (
                            <tr key={searchResult.id}>
                                <td>{searchResult.note}</td>
                                <td>
                                    <Link to="/form" state={{ data: searchResult.id }}>
                                        <button type="button">Edit</button>
                                    </Link>
                                </td>
                                <td>
                                    <button onClick={() => handleDelete(searchResult.id)}>Delete</button>
                                </td>
                            </tr>
                        ))
                        }
                    </tbody>}
                </table>
            </div>
        </div>

    );
};


export default Home;

