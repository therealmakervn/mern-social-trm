const express = require('express');
const router = express.Router();
const Notification = require('../models/Notification');

// Lấy danh sách thông báo chưa đọc
router.get('/unread', async (req, res) => {
  try {
    const notifications = await Notification.find({ user: req.user.id, read: false });
    res.json(notifications);
  } catch (error) {
    res.status(500).json({ message: 'Server Error' });
  }
});

// Đánh dấu thông báo đã đọc
router.post('/:id/read', async (req, res) => {
  try {
    await Notification.findByIdAndUpdate(req.params.id, { read: true });
    res.json({ message: 'Đã đánh dấu đã đọc' });
  } catch (error) {
    res.status(500).json({ message: 'Server Error' });
  }
});

module.exports = router;
