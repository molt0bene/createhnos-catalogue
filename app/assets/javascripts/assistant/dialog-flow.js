window.DialogFlow = {
  start: {
    message: "Нужна помощь?",
    options: [
      { text: "Да, помоги мне с выбором товара", next: "category" },
      { text: "Нет, спасибо", next: "end" }
    ]
  },
  category: {
    message: "Какая категория вас интересует?",
    options: [
      { text: "Планшеты", next: "price" },
      { text: "Акустика", next: "price" },
      { text: "Умные часы", next: "price" }
    ]
  },
  price: {
    message: "В каком ценовом диапазоне?",
    options: [
      { text: "До 5 000 ₽", next: "color" },
      { text: "5 000 – 15 000 ₽", next: "color" },
      { text: "Выше 15 000 ₽", next: "color" }
    ]
  },
  color: {
    message: "Какой цвет предпочтительнее?",
    options: [
      { text: "Чёрный", next: "result" },
      { text: "Белый", next: "result" },
      { text: "Без разницы", next: "result" }
    ]
  },
  result: {
    message: "",
    options: []
  },
  end: {
    message: "Обращайтесь, если передумаете!",
    options: []
  }
};
