# worship_house_media

Worship House Ministries, Olokoka Ddi Village

## Folder Structure

### screens: 
This folder contains the screens which will be configured in the routes in the main.dart file.

### providers: 
I’m using provider pattern for this application for state management, so all the provider files goes to the providers folder with the file naming convention “user_provider.dart” as an example.

### models: 
Providers will use these models, sort of mapped with my entity in database.

### services: 
This folder is for backend operation like connecting to the Firestore or invoking HTTP calls etc.

### utilities: 
All the common items goes in here, example., constants used in the project.

### widgets: 
Contains the common widgets for your applications. For example, Button , TextField etc.

### routes.dart: 
Contains the routes of your application and imports all screens.
