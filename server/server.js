const express = require("express");

const app = express();
app.use(express.json());

app.get("/shoe/:id", (req, res)=> {

})

app.listen(5000);