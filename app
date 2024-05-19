const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();

app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'database.html'));
});

app.post('/submit', (req, res) => {
  const { fname, lname, oname, email, phone, gender } = req.body;

  if (!fname || !lname || !oname || !email || !phone || !gender) {
    return res.sendFile(path.join(__dirname, 'error.html'));
  }

  console.log('Form Data: ', {
    FirstName: fname,
    LastName: lname,
    OtherName: oname,
    EmailAddress: email,
    PhoneNumber: phone,
    Gender: gender,
  });

  res.sendFile(path.join(__dirname, 'success.html'));
});

app.listen(4000, 'localhost', () =>
