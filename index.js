const express = require("express");
const cors = require("cors");
const session = require("express-session");
const bodyParser = require('body-parser');
const dotenv = require("dotenv");
const db = require("./config/database.js");
const SequelizeStore = require("connect-session-sequelize");
const UserRoute = require("./routes/UserRoute.js");
const NoteRoute = require("./routes/NoteRoute.js");
const StudentRoute = require("./routes/StudentRoute.js");
const StudentReportRoute = require("./routes/StudentReportRoute.js");
const BookingRoute = require("./routes/BookingRoute.js");
const ClassScheduleRoute = require("./routes/ClassScheduleRoute.js");
//const ProductRoute = require("./routes/ProductRoute.js");
const AuthRoute = require("./routes/AuthRoute.js");
const app = express();
const sessionStore = SequelizeStore(session.Store);
const port = 3000;
const router = express.Router();
const http = require('http').createServer(app).listen(3000);

dotenv.config();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());


const store = new sessionStore({
    db: db
});

app.use(session({ secret: 'somevalue' }));

app.use(cors({
    origin: 'http://localhost:3000'
}));

app.use(express.json());
app.use(UserRoute);
app.use(AuthRoute);
app.use(NoteRoute);
app.use(BookingRoute);
app.use(StudentRoute);
app.use(StudentReportRoute);
app.use(ClassScheduleRoute);

// store.sync();
app.listen(process.env.APP_PORT, () => {
    console.log('Server is running...');
});