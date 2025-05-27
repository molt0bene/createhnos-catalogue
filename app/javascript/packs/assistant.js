import { renderDialog } from "../../assets/javascripts/assistant/dialog-handler";

document.addEventListener("DOMContentLoaded", () => {
  const assistant = document.getElementById("assistant");
  const assistantImg = document.getElementById("assistant-img");

  if (!assistant || !assistantImg) return;

  let isExpanded = false;
  const imgHid = assistantImg.dataset.hid;
  const imgStart = assistantImg.dataset.start;

  assistantImg.addEventListener("click", () => {
    isExpanded = !isExpanded;
    assistantImg.src = isExpanded ? imgStart : imgHid;
    assistant.classList.toggle("expanded", isExpanded);
    assistant.classList.toggle("assistant-hidden", !isExpanded);

    if (isExpanded) {
      setTimeout(() => {
        assistant.classList.add("show-dialog");
        renderDialog("start");
      }, 400);
    } else {
      assistant.classList.remove("show-dialog");
    }
  });
});
