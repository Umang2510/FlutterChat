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
    
    match /chat/{document=**} {
    	allow read, create: if request.auth != null;
    }
    
  }
}
```

>### Note
>> Recently I tried to build apk of this file And got many errors. So, if you are using this repo then you have to migrate to a newer version of Flutter. I tried many things based on knowledge but nothing worked. If you have solution then let me know. [Linktree](https://linktr.ee/umang2510)
