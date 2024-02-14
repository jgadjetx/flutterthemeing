
Creating a project with a dynamic applicatonID/BundleID that will be loaded from a config file is not possible, best route would be using themes.

How to:

Create flutter project but specify --org

Create themes that can be loaded dynamically, and based on the theme, build the app as following:

flutter build appbundle --release --dart-define THEME=“themeName”

Where “themeName” is the name of the theme, the apk will be generated with that theme
cross referenced from a variable file. I’ve tested using a json file.

Once the json file has been loaded. A Theme can be applied.

Eg. 

If theme from the json file is ‘Cybersmart’ then load the cybersmart theme across the app.