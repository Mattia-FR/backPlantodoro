const express = require("express");

const router = express.router();

const movieROuter = require("./movieRouter");

router.use("/plant", plantRouter);

module.exports = router;
