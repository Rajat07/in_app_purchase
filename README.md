## InAppPurchase-Subscription

This gem id used to verify subscription based InAppPurchase receipt. 


## Installation

Add it to your Gemfile:

```ruby
gem 'in_app_purchase', git: 'https://github.com/Rajat07/in_app_purchase.git'
```

Finally, restart the server to apply the changes.


## Information

To verify receipt, use methods checkSandboxReceipt and checkPurchaseReceipt. These methods are used along with hash containing
receipt-data and password.

```ruby
{"receipt-data" => <receipt data>, "password" => <password>}.checkSandboxReceipt
```

* checkSandboxReceipt is used to send receipt-data in sandboxing environment.
* checkPurchaseReceipt is used to send receipt-data in production environment.
* Response is Net::HTTP object. Obtain data by JSON parsing the response body.


