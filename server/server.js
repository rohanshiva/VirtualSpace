const express = require("express");

const app = express();
app.use(express.json());


app.post("/order", (req, res)=>{
    const body = req.body;
    res.status(200).send({"error": false})
});
