const express = require("express");
const router = express.Router();
const User = require("../models/User");

// @route    POST /api/auth/signup
// @desc     Register user
router.post("/signup", async (req, res) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({ message: "Email and password are required." });
    }

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: "User already exists." });
    }

    const newUser = new User({ email, password });
    await newUser.save();

    res.status(201).json({ message: "User created." });
  } catch (err) {
    console.error("Signup error:", err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

module.exports = router;
