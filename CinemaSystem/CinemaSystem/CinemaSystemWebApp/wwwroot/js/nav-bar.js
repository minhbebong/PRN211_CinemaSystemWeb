window.addEventListener('load', function () {
    const navBar = document.querySelector('.cgv-nav-bar');
    const navBarOverlay = document.querySelector('.cgv-nav-bar__overlay');

    if (!navBar || !navBarOverlay)
        return;

    navBar.style.marginLeft = `-${navBar.offsetWidth}px`;
    const navBarButtons = document.getElementsByClassName(navBar.dataset.buttonClass);

    if (navBarButtons)
        for (const button of navBarButtons) {
            button.addEventListener('click', function () {
                navBar.classList.toggle('active');
                navBarOverlay.style.display = navBar.classList.contains('active') ? 'block' : 'none';
            });
        }

    navBarOverlay.addEventListener('click', function () {
        navBar.classList.remove('active');
        navBarOverlay.style.display = 'none';
    });
});

window.addEventListener('resize', function () {
    const navBar = document.querySelector('.cgv-nav-bar');
    navBar.style.marginLeft = `-${navBar.offsetWidth}px`;
});

function toggleCategory() {
    const category = document.querySelector(".cgv-nav-bar__category");
    category.classList.toggle('active');
}
