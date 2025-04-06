const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send('Hello, World! Welcome to my AWS-hosted Web App 🚀');
});

const PORT = process.env.PORT || 3000;
app.listen(3000, '0.0.0.0', () => {
    console.log(`Server is running on port ${PORT}`);
});
