import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAli2goor7db4mzsy_ZxgzrrkiV5ewVcFQ",
            authDomain: "sound-sleep-aid-app-uos9s6.firebaseapp.com",
            projectId: "sound-sleep-aid-app-uos9s6",
            storageBucket: "sound-sleep-aid-app-uos9s6.appspot.com",
            messagingSenderId: "465999830390",
            appId: "1:465999830390:web:34d72860879da4ba216e57"));
  } else {
    await Firebase.initializeApp();
  }
}
