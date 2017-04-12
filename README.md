# README


## setup
### .env vars
* BASECAMP_CLIENT_ID
* BASECAMP_CLIENT_SECRET
* BASECAMP_AUTHENTICATION_TOKEN (while testing...)
### other tools
* need to setup MongoDB


## urls
* http://localhost:3000/test/oauth
* http://localhost:3000/test/sync

## integrations
### basecamp
https://integrate.37signals.com/apps
### harvest
TODO
### bitbucket
TODO


## docs
* https://github.com/basecamp/bc3-api
* https://github.com/intridea/oauth2
* http://blog.arkency.com/2014/11/dont-forget-about-eager-load-when-extending-autoload/

## utils
### converting html > haml
```
for file in app/views/**/*.erb; do html2haml -e $file ${file%erb}haml && rm $file; done
```
