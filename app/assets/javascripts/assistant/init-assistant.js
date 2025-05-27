document.addEventListener("DOMContentLoaded", function () {
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
        window.renderDialog("start");
        assistant.classList.add("show-dialog");
      }, 0);
    } else {
      assistant.classList.remove("show-dialog");
      document.getElementById("assistant-dialog").innerHTML = "";
    }
  });

});
