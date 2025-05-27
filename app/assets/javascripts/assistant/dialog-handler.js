window.userSelections = {};
window.renderDialog = function(stepKey) {
  const step = window.DialogFlow[stepKey];
  const dialog = document.getElementById("assistant-dialog");

  dialog.innerHTML = "";

  const title = document.createElement("p");
  title.className = "dialog-title";
  title.textContent = step.message;
  dialog.appendChild(title);

  if (stepKey === "result") {
    const title = document.createElement("p");
    title.className = "dialog-title";
    title.textContent = "Подбираю подходящие товары...";
    dialog.appendChild(title);

    fetch("/assistant/recommend", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify(window.userSelections)
    })
      .then((res) => {
        if (!res.ok) {
          throw new Error(`Ошибка сервера: ${res.status}`);
        }
        return res.json();
      })
      .then((data) => {
        const resultsList = document.createElement("div");
        resultsList.style.marginTop = "10px";

        if (data.length === 0) {
          title.textContent = "У нас пока нет таких товаров...";

          resultsList.innerText = "Но наш ассортимент постоянно пополняется. Следите за обновлениями 😊";
        } else {
          title.textContent = "Вот что я нашёл:";

          const resultsList = document.createElement("div");
          resultsList.style.marginTop = "10px";
          data.forEach((product) => {
            const link = document.createElement("a");
            link.href = product.url;
            link.textContent = product.name;
            link.style.display = "flex";
            resultsList.appendChild(link);
          });
        }

        dialog.appendChild(resultsList);
      })
      .catch((error) => {
        console.error("Ошибка при получении рекомендаций:", error);

        title.textContent = "Произошла ошибка 😥";
        const errorMessage = document.createElement("p");
        errorMessage.textContent = "Не удалось получить рекомендации. Попробуйте позже.";
        errorMessage.style.color = "red";
        dialog.appendChild(errorMessage);
      });

    return;
  }


  if (step.options.length > 0) {
    const buttons = document.createElement("div");
    buttons.className = "dialog-buttons";

    step.options.forEach(option => {
      const btn = document.createElement("button");
      btn.textContent = option.text;
      btn.onclick = () => {
        const key = stepKey; // e.g. "category", "price", etc.
        window.userSelections[key] = option.text;
        renderDialog(option.next);
      };
      buttons.appendChild(btn);
    });

    dialog.appendChild(buttons);
  }
};
