# ios-template

A template that generates a starting point for a new iOS project.

# Renaming the template project
To rename the template project, run the "rename.swift" script in the following way

```
./rename.swift Template NEW_PROJECT_NAME
```

After the script successfully renames the project, you will need to rename the root project folder from "Template" to "NEW_PROJECT_NAME". Should be good-to-go after this completes.

# Architecture
The template project contains multiple Xcode file templates, tailored for multiple architectural approaches. There are templates for the VIP architecture and the VIPER architecture. 

To use the templates, you copy the .xctemplate directory to `~/Library/Developer/Xcode/Templates/` and restart Xcode. Once you open up Xcode again, the templates should be ready for use once the "New file" dialog has been opened.
