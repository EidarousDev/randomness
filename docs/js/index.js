'use strict';

const images = {
    user_interface: 'user_interface.gif',
    quiz_editor: 'quiz_editor.gif',
    ads_integration: 'ads_integration.gif',
    build: 'build.gif',
    share_experience: 'share_experience.gif',
    bot: 'bot.png',
};

Object.entries(images).forEach(([id, image]) => {
    const img = new Image();
    img.src = `img/demo/${image}`;
    img.addEventListener('load', () => {
        if (img.naturalWidth + img.naturalWidth === 0) {
            return;
        }

        const span = document.getElementById(id);
        span.appendChild(img);
        span.classList.add('no-background');
    });
});
