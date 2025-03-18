const express = require("express");

const router = express.Router();

const plantRouter = require("./plantRouter");

router.use("/plant", plantRouter);

module.exports = router;
