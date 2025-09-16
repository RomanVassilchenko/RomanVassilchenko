// Enhanced features for blog posts
(function() {
    'use strict';

    // Автоматическое добавление иконок к заголовкам
    function addIconsToHeadings() {
        const headings = document.querySelectorAll('.post-content h2, .post-content h3');

        const iconMap = {
            'основные понятия': 'icon-concepts',
            'архитектура': 'icon-architecture',
            'компоненты': 'icon-components',
            'безопасность': 'icon-security',
            'security': 'icon-security',
            'производительность': 'icon-performance',
            'performance': 'icon-performance',
            'api': 'icon-api',
            'база данных': 'icon-database',
            'database': 'icon-database',
            'развертывание': 'icon-deployment',
            'deployment': 'icon-deployment',
            'тестирование': 'icon-testing',
            'testing': 'icon-testing',
            'документация': 'icon-documentation',
            'documentation': 'icon-documentation',
            'мониторинг': 'icon-monitoring',
            'monitoring': 'icon-monitoring',
            'конфигурация': 'icon-configuration',
            'configuration': 'icon-configuration',
            'заключение': 'icon-conclusion',
            'conclusion': 'icon-conclusion',
            'методика': 'icon-methodology',
            'methodology': 'icon-methodology',
            'примеры': 'icon-examples',
            'examples': 'icon-examples',
            'алгоритм': 'icon-algorithms',
            'algorithms': 'icon-algorithms',
            'реализация': 'icon-implementation',
            'implementation': 'icon-implementation',
            'преимущества': 'icon-benefits',
            'benefits': 'icon-benefits',
            'риски': 'icon-risks',
            'risks': 'icon-risks',
            'faq': 'icon-faq',
            'часто задаваемые вопросы': 'icon-faq'
        };

        headings.forEach(heading => {
            const text = heading.textContent.toLowerCase();
            for (const [keyword, className] of Object.entries(iconMap)) {
                if (text.includes(keyword)) {
                    heading.classList.add(className);
                    break;
                }
            }
        });
    }

    // Цветовое кодирование уровней сложности
    function addComplexityColors() {
        const content = document.querySelector('.post-content');
        if (!content) return;

        // Найти и покрасить эмодзи уровней сложности
        const walker = document.createTreeWalker(
            content,
            NodeFilter.SHOW_TEXT,
            null,
            false
        );

        const textNodes = [];
        let node;
        while (node = walker.nextNode()) {
            textNodes.push(node);
        }

        textNodes.forEach(textNode => {
            if (textNode.textContent.includes('🟢')) {
                const span = document.createElement('span');
                span.className = 'complexity-basic';
                span.textContent = textNode.textContent;
                textNode.parentNode.replaceChild(span, textNode);
            } else if (textNode.textContent.includes('🟡')) {
                const span = document.createElement('span');
                span.className = 'complexity-intermediate';
                span.textContent = textNode.textContent;
                textNode.parentNode.replaceChild(span, textNode);
            } else if (textNode.textContent.includes('🔴')) {
                const span = document.createElement('span');
                span.className = 'complexity-advanced';
                span.textContent = textNode.textContent;
                textNode.parentNode.replaceChild(span, textNode);
            }
        });
    }


    // Прогресс-бар чтения
    function addReadingProgressBar() {
        const progressBar = document.createElement('div');
        progressBar.className = 'reading-progress';
        progressBar.innerHTML = '<div class="reading-progress-fill"></div>';
        document.body.appendChild(progressBar);

        const progressFill = progressBar.querySelector('.reading-progress-fill');

        function updateProgress() {
            const windowHeight = window.innerHeight;
            const documentHeight = document.documentElement.scrollHeight - windowHeight;
            const scrollTop = window.pageYOffset;
            const progress = (scrollTop / documentHeight) * 100;

            progressFill.style.width = Math.min(progress, 100) + '%';
        }

        window.addEventListener('scroll', updateProgress);
        updateProgress();
    }

    // Кнопка "Наверх"
    function addScrollToTopButton() {
        const button = document.createElement('button');
        button.className = 'scroll-to-top';
        button.innerHTML = '↑';
        button.setAttribute('aria-label', 'Прокрутить наверх');
        button.style.display = 'none';
        document.body.appendChild(button);

        function toggleButton() {
            if (window.pageYOffset > 300) {
                button.style.display = 'block';
            } else {
                button.style.display = 'none';
            }
        }

        button.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });

        window.addEventListener('scroll', toggleButton);
    }

    // Lazy loading для Mermaid диаграмм
    function addLazyLoadingForDiagrams() {
        const mermaidElements = document.querySelectorAll('.mermaid');

        if ('IntersectionObserver' in window) {
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const element = entry.target;
                        if (!element.classList.contains('mermaid-loaded')) {
                            element.classList.add('mermaid-loaded');
                            // Mermaid уже инициализирован Hugo, просто помечаем как загруженный
                        }
                        observer.unobserve(element);
                    }
                });
            }, {
                rootMargin: '50px'
            });

            mermaidElements.forEach(element => {
                observer.observe(element);
            });
        }
    }

    // Кастомный Table of Contents
    function addCustomTOC() {
        const content = document.querySelector('.post-content');
        if (!content) return;

        const headings = content.querySelectorAll('h2, h3, h4');
        if (headings.length < 3) return; // Показываем ToC только если заголовков больше 2

        // Создаем ID для заголовков, если их нет
        headings.forEach((heading, index) => {
            if (!heading.id) {
                const text = heading.textContent.toLowerCase()
                    .replace(/[#📖🟢🟡🔴🏗️🔄🗄️☁️🤖📊]/g, '') // удаляем эмодзи и символы
                    .replace(/[^\w\s-]/g, '') // удаляем остальные специальные символы
                    .replace(/\s+/g, '-') // заменяем пробелы на дефисы
                    .replace(/-+/g, '-') // убираем повторяющиеся дефисы
                    .trim();
                heading.id = text || `heading-${index}`;
            }
        });

        // Создаем ToC контейнер
        const tocContainer = document.createElement('div');
        tocContainer.className = 'custom-toc';
        tocContainer.innerHTML = `
            <details open>
                <summary>
                    <span>📑 Содержание</span>
                    <span class="toc-toggle">▼</span>
                </summary>
                <nav class="toc-nav">
                    <ul class="toc-list"></ul>
                </nav>
            </details>
        `;

        // Заполняем ToC
        const tocList = tocContainer.querySelector('.toc-list');
        let currentLevel = 2;
        let currentUL = tocList;
        const ulStack = [tocList];

        headings.forEach(heading => {
            const level = parseInt(heading.tagName.charAt(1));
            // Очищаем текст от эмодзи и символов для отображения в ToC
            const text = heading.textContent
                .replace(/[#📖🟢🟡🔴🏗️🔄🗄️☁️🤖📊⚡🔌🚀🧪⚙️✅🔬💼🧮🎯⚠️❓]/g, '')
                .trim();
            const id = heading.id;

            // Управляем вложенностью
            if (level > currentLevel) {
                // Углубляемся
                const lastLi = currentUL.lastElementChild;
                if (lastLi) {
                    let nestedUL = lastLi.querySelector('ul');
                    if (!nestedUL) {
                        nestedUL = document.createElement('ul');
                        nestedUL.className = 'toc-nested';
                        lastLi.appendChild(nestedUL);
                    }
                    ulStack.push(nestedUL);
                    currentUL = nestedUL;
                }
            } else if (level < currentLevel) {
                // Поднимаемся
                const levelDiff = currentLevel - level;
                for (let i = 0; i < levelDiff && ulStack.length > 1; i++) {
                    ulStack.pop();
                }
                currentUL = ulStack[ulStack.length - 1];
            }

            currentLevel = level;

            // Создаем элемент ToC
            const li = document.createElement('li');
            li.className = `toc-level-${level}`;
            li.innerHTML = `<a href="#${id}" class="toc-link">${text}</a>`;
            currentUL.appendChild(li);
        });

        // Вставляем ToC в начало контента
        const firstElement = content.firstElementChild;
        if (firstElement) {
            content.insertBefore(tocContainer, firstElement);
        }

        // Добавляем функциональность
        const summary = tocContainer.querySelector('summary');
        const toggle = tocContainer.querySelector('.toc-toggle');
        const details = tocContainer.querySelector('details');

        summary.addEventListener('click', (e) => {
            e.preventDefault();
            if (details.open) {
                details.removeAttribute('open');
                toggle.textContent = '▶';
            } else {
                details.setAttribute('open', '');
                toggle.textContent = '▼';
            }
        });

        // Подсветка активной секции
        const tocLinks = tocContainer.querySelectorAll('.toc-link');
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    tocLinks.forEach(link => link.classList.remove('active'));
                    const activeLink = tocContainer.querySelector(`a[href="#${entry.target.id}"]`);
                    if (activeLink) {
                        activeLink.classList.add('active');
                    }
                }
            });
        }, {
            rootMargin: '-10% 0px -50% 0px'
        });

        headings.forEach(heading => {
            observer.observe(heading);
        });
    }

    // Улучшенные якорные ссылки
    function enhanceAnchorLinks() {
        const headings = document.querySelectorAll('.post-content h2, .post-content h3, .post-content h4');

        headings.forEach(heading => {
            if (heading.id) {
                const anchor = document.createElement('a');
                anchor.href = '#' + heading.id;
                anchor.className = 'anchor-link';
                anchor.innerHTML = '🔗';
                anchor.setAttribute('aria-label', 'Ссылка на этот раздел');
                anchor.style.opacity = '0';
                anchor.style.marginLeft = '8px';
                anchor.style.textDecoration = 'none';
                anchor.style.transition = 'opacity 0.2s';

                heading.addEventListener('mouseenter', () => {
                    anchor.style.opacity = '0.7';
                });

                heading.addEventListener('mouseleave', () => {
                    anchor.style.opacity = '0';
                });

                heading.appendChild(anchor);
            }
        });
    }

    // Инициализация всех функций
    function init() {
        // Ждем загрузки DOM
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', init);
            return;
        }

        addIconsToHeadings();
        addComplexityColors();
        addCustomTOC();
        addReadingProgressBar();
        addScrollToTopButton();
        addLazyLoadingForDiagrams();
        enhanceAnchorLinks();
    }

    init();
})();