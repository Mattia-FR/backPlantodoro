const express = require("express");

const router = express.router();

// get http://localhost:4242/api/plant/
router.get("/", (req, res) => {
	console.log("Je suis sur la route /api/plant");
});

module.exports = router;
