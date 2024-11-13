import React, { useEffect, useState } from 'react';
import socket from '../utils/socket';
import axios from 'axios';

function Notifications() {
  const [notifications, setNotifications] = useState([]);

  useEffect(() => {
    // Kết nối Socket.io
    socket.on('receiveNotification', (notification) => {
      setNotifications((prev) => [notification, ...prev]);
    });

    // Lấy danh sách thông báo chưa đọc từ API
    axios.get('/api/notifications/unread')
      .then(response => {
        setNotifications(response.data);
      })
      .catch(error => {
        console.error('Error fetching notifications:', error);
      });

    return () => {
      socket.off('receiveNotification');
    };
  }, []);

  const markAsRead = (id) => {
    axios.post(`/api/notifications/${id}/read`)
      .then(() => {
        setNotifications(notifications.filter(notif => notif.id !== id));
      })
      .catch(error => {
        console.error('Error marking notification as read:', error);
      });
  };

  return (
    <div>
      <h2>Thông Báo</h2>
      <ul>
        {notifications.map(notif => (
          <li key={notif.id}>
            {notif.message}
            <button onClick={() => markAsRead(notif.id)}>Đánh dấu đã đọc</button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Notifications;
