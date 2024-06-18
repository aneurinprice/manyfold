Rails.application.config.session_store :cookie_store,
  expire_after: 14.days,
  key: "_manyfold_session",
  same_site: :strict,
  secure: Rails.application.config.force_ssl
