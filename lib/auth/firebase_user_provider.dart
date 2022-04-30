import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AllnimallRangerFirebaseUser {
  AllnimallRangerFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AllnimallRangerFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AllnimallRangerFirebaseUser> allnimallRangerFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AllnimallRangerFirebaseUser>(
            (user) => currentUser = AllnimallRangerFirebaseUser(user));
