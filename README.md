# README


## setup
### .env vars
* BASECAMP_CLIENT_ID
* BASECAMP_CLIENT_SECRET
* BASECAMP_AUTHENTICATION_TOKEN (while testing...)
### other tools
* need to setup MONGO


## url
* http://localhost:3000/test/oauth
* http://localhost:3000/test/sync

## integrations
### basecamp
https://integrate.37signals.com/apps


## utils
### converting html > haml
```
for file in app/views/**/*.erb; do html2haml -e $file ${file%erb}haml && rm $file; done
```
