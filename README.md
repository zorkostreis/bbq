# BBQ

## Описание

Приложение для планирования мероприятий. Пользователи могут создавать события, на которые можно подписываться. Доступ к событиям можно ограничить с помощью пинкода. Также в комментариях можно обсуждать события и делиться фотографиями! 

Последнюю актуальную версию приложения можно посмотреть [здесь](http://bbqevent.site/).

**Использованные технологии**:
- ActionMailer, [Mailjet](https://app.mailjet.com/) для реализации рассылки
- ActiveStorage, [Yandex Cloud Storage](https://cloud.yandex.ru/services/storage) для хранения фотографий
- [OmniAuth](https://github.com/omniauth/omniauth) для аутентификации через Google и GitHub
- [API Яндекс.Карт](https://yandex.ru/dev/maps/?p=realty) для отображения адреса события
- ActiveJob, Redis, [Resque](https://github.com/resque/resque) для фоновых задач
- [Lightbox2](https://lokeshdhakar.com/projects/lightbox2/) для галереи с фотографиями события
- Devise, Pundit для аутентификациии и авторизации

Требования:

```
Ruby 3.0.2
Rails 6.1.6
```

## Использование

Установите необходимые гемы и подготовьте базу данных с помощью следующих команд:

```
bundle install
bundle exec rake db:migrate
```

Для использования сторонних сервисов, упомянутых выше, нужно прописать Ваши ключи в `credentials.yml.enc`.

Для этого требуется ввести следующие команды:

```
rm -rf config/credentials.yml.enc
EDITOR=<your_prefered_editor> rails credentials:edit 
```

Затем заполнить по образцу:

```
yc:
  access_key_id: <your_key>
  secret_access_key: <your_key>

mailjet:
  api_key: <your_key>
  secret_key: <your_key>
  sender: <your_sender_email>

map:
  api_key: <your_key>

omniauth:
  github:
    id: <your_id>
    secret: <your_secret>
  google:
    id: <your_id>
    secret: <your_secret>
```

### Запуск

Для запуска сервера локально введите команду:

```
bundle exec rails s
```
