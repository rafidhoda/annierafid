function init() {
    window.addEventListener('scroll', function(e){
        var distanceY = window.pageYOffset || document.documentElement.scrollTop,
            shrinkOn = 100,
            header = document.querySelector("nav");
			submenu = document.querySelector("#main_menu ul ul.sub-menu");
        if (distanceY > shrinkOn) {
            classie.add(header,"menugray");
			classie.add(submenu,"menugray");
        } else {
            if (classie.has(header,"menuwhite")) {
                classie.remove(header,"menugray");
            }
        }
    });
}
window.onload = init();