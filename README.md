# Redsys::Rails

Redsys-Rails is a small solution to quickly and easily integrate the payment gateway of [Redsys.es] (http://www.redsys.es/).

## Requirements
- This gem only provides the necessary tools to integrate the redirection option from the merchant's website to the contracted virtual POS.
- It is necessary to have the access codes that the financial institution will have provided to the merchant in order to install this gem.

## Installation
Add the following line to your application's Gemfile:

```ruby
gem 'redsys-rails', git: 'https://github.com/codecourse-cc/redsys-rails'
```

Run:

    $ bundle

Generate the initializer by running the generator:

    $ rails g redsys:install

Finally, configure the virtual POS parameters in [config/initializers/redsys-rails.rb](lib/generators/templates/redsys-rails.rb)

## Use

In the controller where you process your order, once the unique id of the order has been obtained,
redirect to the virtual POS jump form using the following code.

```ruby
redirect_to redsys_form_path(amount: '', order: '', language: '')
```

An example:

```ruby
redirect_to redsys_form_path(amount: '10.20', order: '0001', language: '001')
```

#### Language codes

Spanish-001, English-002, Catalan-003, French-004, German-005, Dutch-006, Italian-007, Swedish-008, Portuguese-009, Valencian-010, Polish-011, Galician-012 and Euskera-013

#### Return URL

If you have not configured the return url's for correct transaction and for failed transaction in the control panel of your business,
you can provide them in the redirect using the url_ok and url_ko parameters.

An example:

```ruby
redirect_to redsys_form_path(amount: '20.35', order: '0001', language: '001', url_ok: 'http://misite.com/order_ok', url_ko: 'http://misite.com/order_error')
```

#### Test data

With your development credentials you can test with the following data:

```
# Correct card
Card number: 4548812049400004
Expiration: 12/20
CVV2 code: 123
CIP Code: 123456
```

```
# Wrong card
Card number: 1111111111111117
Expiration: 12/20
```

## Online notification

Installation of the webhook for online notification.

    $ rails g redsys:notifications

The module is functional and makes accessible a route for the virtual POS to notify the transaction. This is where the trade
You have to carry out the necessary actions, such as updating the status of your order confirming the payment.

rails g redsys:notifications which will create a 'notifications_controller' controller with a post 'notification' action. The financial institution will make a call to that route when the user makes the payment, there you can update the order, send an email to the user ... etc.

If you want to debug what happens in that callback, I suggest you use an ngrok-style application that redirects localhost to an address accessible from outside and in the gateway form, replace the notifications url with the generated one. An example:
redsys_form_path (amount: @amount, order: @ order.id, merchant_url: 'http://435dsds3.ngrok.io/redsys/notification')

When you upload it to production remember to remove the merchant_url parameter so that it catches the default url.

