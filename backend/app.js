const createError = require("http-errors");
const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");

const passport = require("passport");
const session = require("express-session");

let indexRouter = require("./routes/index");
let usersRouter = require("./routes/users");
let sheltersRouter = require("./routes/shelters");
let postsRouter = require("./routes/posts");
let adoptedRouter = require("./routes/adopted");
let favoritedRouter = require("./routes/favorited");
let commentsRouter = require("./routes/comments");
let petfinderRouter = require("./routes/petfinderAPIRoute");

let app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "jade");

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use(
  session({
    secret: "never gonna give u up",
    resave: false,
    saveUninitialized: true
  })
);
app.use(passport.initialize());
app.use(passport.session());

app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);
app.use("/users", usersRouter);
// app.use('/shelters', sheltersRouter);
app.use("/posts", postsRouter);
app.use("/adopted", adoptedRouter);
app.use("/favorited", favoritedRouter);
app.use("/comments", commentsRouter);
app.use("/petfinder", petfinderRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;