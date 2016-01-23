every 2.minute do
  command "cd /Users/user/Google\ Drive/sites/em_andamento/aquicambio && bin/rails runner -e development 'ExchangeOperation.crawler_auto'"
end