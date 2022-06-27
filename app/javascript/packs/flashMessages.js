import Toastify from "toastify-js";

document.addEventListener('DOMContentLoaded', () => {

  JSON.parse(document.body.dataset.flashMessages).forEach(flashMessage => {
    const [type,message] = flashMessage;

    Toastify({
      text: message,
      duration: 3000,
      close: true,
      backgroundColor: "green",
      stopOnFocus: true 
    }).showToast();
  });
});
