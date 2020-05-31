const express = require("express");
const mailService = require("@sendgrid/mail");
const SGCred = require("./config");
const crypto = require("crypto");
const cors = require("cors");

const app = express();
cors(app);
app.use(express.json());
mailService.setApiKey(SGCred.key);


app.post("/order", async (req, res)=>{
    try{
        const body = req.body;
        const {email, items, price} = body;
        const id  = crypto.randomBytes(6).toString('hex');
        const msg = {
            to: email,
            from: 'ramapitchala@gmail.com',
            subject: id,
            text: 'and easy to do anywhere, even with Node.js',
            html: `<strong>You ordered ${items.join(" ")} for ${price}</strong>`,
        };
        await mailService.send(msg);
        res.status(200).send({error:false});
    }
    catch(error){
        console.log(error)
        res.status(400).send({error:true});
    }
});


app.listen(5000);