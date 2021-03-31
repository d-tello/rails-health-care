const toggleMobileNavbar = () => {
  const navbar = document.querySelector('.navbar-icon-bar');
  const menu = document.querySelector('.navbar-menu');

  if (navbar) {
    navbar.addEventListener('click', () => {
      navbar.classList.toggle('open');
      menu.classList.toggle('open');
      event.preventDefault();
    });
  }
}

export { toggleMobileNavbar };
