Cport::Application.config.middleware.use ExceptionNotification::Rack,
                                         :email => {
                                             :email_prefix => "[ERROR FinIn] ",
                                             :sender_address => %{"notifier" <noreply@finstrument.com>},
                                             :exception_recipients => %w{rebisall@gmail.com}
                                         }