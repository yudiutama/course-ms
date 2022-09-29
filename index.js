const express = require("express")
const cors = require("cors")
const session = require("express-session")
const bodyParser = require('body-parser')
const dotenv = require("dotenv")
const db = require("./config/database.js")
const UserRoute = require("./routes/UserRoute.js")
const NoteRoute = require("./routes/NoteRoute.js")
const AuthRoute = require("./routes/AuthRoute.js")
const BookingRoute = require("./routes/BookingRoute.js")
const StudentRoute = require("./routes/StudentRoute.js")
const ReportTeacher = require("./routes/ReportTeacherRoute")
const ReportUnitRoute = require("./routes/ReportUnitRoute")
const SequelizeStore = require("connect-session-sequelize")
const StudentReportRoute = require("./routes/StudentReportRoute.js")
const ClassScheduleRoute = require("./routes/ClassScheduleRoute.js")
const app = express()
const sessionStore = SequelizeStore(session.Store)
const port = process.env.port || 3000;

dotenv.config();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

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
app.use(ReportTeacher);
app.use(ReportUnitRoute);

// store.sync();
app.listen(port, () => {
    console.log(`Server is running at port: ${port}!`);
});