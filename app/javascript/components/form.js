const formDisable = () => {

  const editor = document.querySelector(".schedule-editor")

  const update = checkbox => {
    const inputs = checkbox.parentNode.parentNode.parentNode.parentNode.parentNode.querySelectorAll("input[type='text']")
    if (checkbox.checked) {
      inputs.forEach(input => input.removeAttribute("disabled"))
    } else {
      inputs.forEach(input => input.setAttribute("disabled", "true"))
    }
  }
  if (editor) {
    let checkboxes = editor.querySelectorAll("input[type='checkbox']")

    checkboxes.forEach(checkbox => {
      update(checkbox)
      checkbox.addEventListener("click", () => {
        update(checkbox)
      })
    })
  }
}

export { formDisable };
