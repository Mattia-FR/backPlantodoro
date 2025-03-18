const express = require("express");

const router = express.Router();

// get http://localhost:4242/api/plant/
router.get("/", (req, res) => {
	res.send("Je suis sur la route /api/plant");
});

module.exports = router;
