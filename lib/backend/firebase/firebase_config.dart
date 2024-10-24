import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDr0XvhgKASrS9zD5sZ6ZGA3QGIXQoal8c",
            authDomain: "register-to-area-zf5kr6.firebaseapp.com",
            projectId: "register-to-area-zf5kr6",
            storageBucket: "register-to-area-zf5kr6.appspot.com",
            messagingSenderId: "441423312575",
            appId: "1:441423312575:web:09b0afea5514765e3eb80a"));
  } else {
    await Firebase.initializeApp();
  }
}
