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

const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar');

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 10) {
        navbar.classList.add('shadow');
      } else {
        navbar.classList.remove('shadow');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
