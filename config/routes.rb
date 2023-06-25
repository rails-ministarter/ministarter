# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  mount Yabeda::Prometheus::Exporter => '/metrics'
end
