# Используем базовый образ Jenkins LTS с Java 17
FROM jenkins/jenkins:lts

# Устанавливаем Node.js и Newman (CLI для Postman)
USER root
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g newman newman-reporter-htmlextra newman-reporter-allure newman-reporter-html newman-reporter-dashboard && \
    apt-get update && \
    apt-get install -y allure

# Возвращаемся к пользователю Jenkins
USER jenkins

# Установка кодировки
ENV JAVA_OPTS="-Dfile.encoding=UTF8"
