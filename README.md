# README



#integrations
##besecamp
https://integrate.37signals.com/apps


# utils
## converting html > haml
```
for file in app/views/**/*.erb; do html2haml -e $file ${file%erb}haml && rm $file; done
```
