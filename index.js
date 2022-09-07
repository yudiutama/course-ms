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
const AuthRoute = require("./routes/AuthRoute.js");
const app = express();
const sessionStore = SequelizeStore(session.Store);
const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');
const {GoogleAuth} = require('google-auth-library');
const port = process.env.port || 3000;

// If modifying these scopes, delete token.json.
const SCOPES = ['https://www.googleapis.com/auth/drive'];
// The file token.json stores the user's access and refresh tokens, and is
// created automatically when the authorization flow completes for the first
// time.
const TOKEN_PATH = 'token.json';

let auth;

// Load client secrets from a local file.
fs.readFile('credentials.json', (err, content) => {
  if (err) return console.log('Error loading client secret file:', err);
  // Authorize a client with credentials, then call the Google Drive API.
  authorize(JSON.parse(content));
});

/** * Create an OAuth2 client with the given credentials, and then execute the * given callback function. * @param {Object} credentials The authorization client credentials. * @param {function} callback The callback to call with the authorized client. */
function authorize(credentials) {
  const { client_secret, client_id, redirect_uris } = credentials.web;
  const oAuth2Client = new google.auth.OAuth2(
    client_id,
    client_secret,
    redirect_uris[0]
  );

  //   // Check if we have previously stored a token.
  // fs.readFile(TOKEN_PATH, (err, token) => {
  //   if (err) return getAccessToken(oAuth2Client, callback);
  //   oAuth2Client.setCredentials(JSON.parse(token));
  //   callback(oAuth2Client);
  // });
}

/** * Get and store new token after prompting for user authorization, and then * execute the given callback with the authorized OAuth2 client. * @param {google.auth.OAuth2} oAuth2Client The OAuth2 client to get token for. * @param {getEventsCallback} callback The callback for the authorized client. */
function getAccessToken(oAuth2Client, callback) {
  const authUrl = oAuth2Client.generateAuthUrl({
    access_type: 'offline',
    scope: SCOPES,
  });
  console.log('Authorize this app by visiting this url:', authUrl);
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  });
  rl.question('Enter the code from that page here: ', (code) => {
    rl.close();
    oAuth2Client.getToken(code, (err, token) => {
      if (err) return console.error('Error retrieving access token', err);
      oAuth2Client.setCredentials(token);
      // Store the token to disk for later program executions
      fs.writeFile(TOKEN_PATH, JSON.stringify(token), (err) => {
        if (err) return console.error(err);
        console.log('Token stored to', TOKEN_PATH);
      });
      callback(oAuth2Client);
    });
  });
}

/**
 * Lists the names and IDs of up to 10 files.
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function listFiles(auth) {
  const drive = google.drive({version: 'v3', auth});
  drive.files.list({
    pageSize: 10,
    fields: 'nextPageToken, files(id, name)',
  }, (err, res) => {
    if (err) return console.log('The API returned an error: ' + err);
    const files = res.data.files;
    if (files.length) {
      console.log('Files:');
      files.map((file) => {
        console.log(`${file.name} (${file.id})`);
      });
    } else {
      console.log('No files found.');
    }
  });
}

/**
 * Insert new file.
 * @return{obj} file Id
 * */
async function uploadBasic() {
  const fs = require('fs');
  const {GoogleAuth} = require('google-auth-library');
  const {google} = require('googleapis');

  // Get credentials and build service
  // TODO (developer) - Use appropriate auth mechanism for your app
  const auth = new GoogleAuth({scopes: 'https://www.googleapis.com/auth/drive'});
  const service = google.drive({version: 'v3', auth});
  const fileMetadata = {
    'title': 'img.jpg',
  };
  const media = {
    mimeType: 'image/jpeg',
    body: fs.createReadStream('./img/img.jpg'),
  };
  try {
    const file = await service.files.create({
      resource: fileMetadata,
      media: media,
      fields: 'id',
    });
    console.log('File Id:', file.data.id);
    return file.data.id;
  } catch (err) {
    // TODO(developer) - Handle error
    throw err;
  }
}

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
app.listen(port, () => {
    console.log(`Server is running at port: ${port}!`);
});