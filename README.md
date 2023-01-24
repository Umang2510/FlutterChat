# FlutterChat
 Chat application using Flutter framework and realtime Firbase support.
 
 Bakend - Firebase </br>
 Frontend - Flutter SDK </br>
 
 Features: </br>
 Login </br>
 Image Upload </br>
 Chat Screen </br>
 Push Notification </br>

 Update firebase rules<br>
 ```firebase
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
  
  	match /users/{uid} {
    	allow write: if request.auth != null && request.auth.uid == uid;
    }
    
    match /users/{uid} {
    	allow read: if request.auth != null;
    }
    
    match /chats/{document=**} {
    	allow read, create: if request.auth != null;
    }
    
  }
}
```