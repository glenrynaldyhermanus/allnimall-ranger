import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GroomerFirebaseUser {
  GroomerFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

GroomerFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GroomerFirebaseUser> groomerFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<GroomerFirebaseUser>(
      (user) {
        currentUser = GroomerFirebaseUser(user);
        return currentUser!;
      },
    );
