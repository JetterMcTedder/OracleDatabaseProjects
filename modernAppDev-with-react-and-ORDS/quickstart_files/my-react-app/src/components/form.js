import React, { useEffect, useState } from 'react';
import { useLocation } from "react-router-dom";

const Form = () => {

    const [noteType, setNoteType] = useState("");
    const [note, setNote] = useState("");
    const [message, setMessage] = useState("");
    const location = useLocation();
    const [resultsData, getResultsData] = useState([]);


    useEffect(() => {
        document.title = 'Create Notes Form';
        if (location.state) {
            const { data } = location.state;

            const fetchUpdate = async () => {
                const { REACT_APP_ORDS_ENDPOINT } = process.env;
                const response = await fetch(
                    `${REACT_APP_ORDS_ENDPOINT}/ords/admin/notes/getnote/${data}`
                );

                const getNoteData = await response.json();
                getResultsData(getNoteData.items);
                setNote(getNoteData.items[0].note);
                setNoteType(getNoteData.items[0].notetype);
            };
            fetchUpdate();

        };

 

    }, []);


    const handleSubmit = (e) => {

        const fetchResults = async () => {
            const { REACT_APP_ORDS_ENDPOINT } = process.env;
            const response = await fetch(
                `${REACT_APP_ORDS_ENDPOINT}/ords/admin/notes/create/`
                , {
                    method: "POST",
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        "notetype": noteType,
                        "note": note,
                    }),
                });

            if (response.status === 200) {
                setNoteType("");
                setNote("");
                setMessage("Note created successfully");
            } else {
                setMessage("Some error occured");
            }
        }
        fetchResults();
        e.preventDefault();
    };

    const handleUpdate = (e) => {

        const fetchUpdate = async () => {
            const { REACT_APP_ORDS_ENDPOINT } = process.env;
            const { data } = location.state;
            const response = await fetch(
                `${REACT_APP_ORDS_ENDPOINT}/ords/admin/notes/update/`
                , {
                    method: "PUT",
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        "note": note,
                        "notetype": noteType,
                        "id": data,
                    }),
                });

            if (response.status === 200) {
                setNoteType(noteType);
                setNote(note);
                setMessage("Note updated successfully");
            } else {
                setMessage("Some error occured");
            }
        }
        fetchUpdate();
        e.preventDefault();
    };


    return (
        <div className="main">
            <div className="formFormat">
                <div className="message">{message ? <p>{message}</p> : null}</div>
                {location.state ?
                    <form onSubmit={handleUpdate}>
                        {resultsData.map((resultsData) => (
                            <span key={resultsData.id}>
                                <div className="formDiv">
                                    <label className="header1 createLabel">Note Type</label>
                                    <input
                                        type="text"
                                        defaultValue={resultsData.notetype}
                                        placeholder="noteType"
                                        onChange={(e) => setNoteType(e.target.value)}
                                    />
                                </div>
                                <div className="formDiv">
                                    <label className="header1 createLabel">Note</label>
                                    <textarea
                                        type="textarea"
                                        defaultValue={resultsData.note}
                                        placeholder="Note"
                                        onChange={(e) => setNote(e.target.value)}
                                    />
                                </div>
                            </span>
                        ))}
                        <div>
                            <button type="submit">Update</button>
                        </div>
                    </form>
                    :
                    <form onSubmit={handleSubmit}>
                        <div className="formDiv">
                            <label className="header1 createLabel">Note Type</label>
                            <input
                                type="text"
                                value={noteType}
                                placeholder="noteType"
                                onChange={(e) => setNoteType(e.target.value)}
                            />
                        </div>
                        <div className="formDiv">
                            <label className="header1 createLabel">Note</label>

                            <textarea
                                type="textarea"
                                value={note}
                                placeholder="Note"
                                onChange={(e) => setNote(e.target.value)}
                            />
                        </div>
                        <div>
                            <button type="submit">Create</button>
                        </div>
                    </form>
                }
            </div>
        </div>
    );
};

export default Form;
