import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HOOPrFirebaseUser {
  HOOPrFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

HOOPrFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HOOPrFirebaseUser> hOOPrFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<HOOPrFirebaseUser>((user) => currentUser = HOOPrFirebaseUser(user));
