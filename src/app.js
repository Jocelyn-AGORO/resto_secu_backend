const express = require('express');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const bcrypt = require('bcryptjs');
const cors = require('cors');

dotenv.config();

const app = express();

app.use(cors({
    origin: 'http://localhost:5173',
    credentials: true
}));
app.use(bodyParser.json());

require('./routes/clientsRoutes')(app);
require('./routes/restaurantsRoutes')(app);
require('./routes/reservationsRoutes')(app);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Le serveur tourne sur le port : http://localhost:${PORT}`);
});
