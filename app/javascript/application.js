import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', function() {
  const assistantAvatar = document.getElementById('assistant-avatar');
  const chatBox = document.getElementById('chat-box');
  const closeChatBtn = document.getElementById('close-chat');
  const chatForm = document.getElementById('chat-form');
  const chatMessages = document.getElementById('chat-messages');
  const chatInput = document.getElementById('chat-input');

  assistantAvatar.addEventListener('click', function() {
    chatBox.classList.toggle('hidden');
  });

  closeChatBtn.addEventListener('click', function() {
    chatBox.classList.add('hidden');
  });

  chatForm.addEventListener('submit', function(e) {
    e.preventDefault();
    const message = chatInput.value.trim();
    if (message !== '') {
      const userMessage = document.createElement('p');
      userMessage.innerHTML = `<strong>Вы:</strong> ${message}`;
      chatMessages.appendChild(userMessage);
      chatInput.value = '';

      // Ответ помощника (заглушка)
      setTimeout(function() {
        const assistantReply = document.createElement('p');
        assistantReply.innerHTML = `<strong>Помощник:</strong> Я вас понял!`;
        chatMessages.appendChild(assistantReply);

        // Автоскролл вниз
        chatMessages.scrollTop = chatMessages.scrollHeight;
      }, 500);
    }
  });
});
