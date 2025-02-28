// ignore_for_file: avoid_unused_constructor_parameters, non_constant_identifier_names, comment_references

@JS('firebase')
library firebase.firebase_interop;

import 'package:js/js.dart';

import 'app_interop.dart';
import 'auth_interop.dart';
import 'database_interop.dart';
import 'es6_interop.dart';
import 'firestore_interop.dart';
import 'messaging_interop.dart';
import 'storage_interop.dart';

@JS()
external List<AppJsImpl> get apps;

/// The current SDK version.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase#.SDK_VERSION>.
@JS()
external String get SDK_VERSION;

@JS()
external AppJsImpl initializeApp(FirebaseOptions options, [String name]);
@JS()
external AppJsImpl app([String name]);
@JS()
external AuthJsImpl auth([AppJsImpl app]);
@JS()
external DatabaseJsImpl database([AppJsImpl app]);
@JS()
external StorageJsImpl storage([AppJsImpl app]);
@JS()
external FirestoreJsImpl firestore([AppJsImpl app]);
@JS()
external MessagingJsImpl messaging([AppJsImpl app]);

/// https://firebase.google.com/docs/reference/js/firebase.User
@anonymous
@JS()
abstract class UserJsImpl extends UserInfoJsImpl {
  external bool get emailVerified;
  external bool get isAnonymous;
  external List<UserInfoJsImpl> get providerData;
  external String get refreshToken;
  external UserMetadata get metadata;
  external PromiseJsImpl delete();
  external PromiseJsImpl<String> getIdToken([bool opt_forceRefresh]);
  external PromiseJsImpl<UserCredentialJsImpl> linkWithCredential(
      OAuthCredential credential);
  external PromiseJsImpl<ConfirmationResultJsImpl> linkWithPhoneNumber(
      String phoneNumber, ApplicationVerifierJsImpl applicationVerifier);
  external PromiseJsImpl<UserCredentialJsImpl> linkWithPopup(
      AuthProviderJsImpl provider);
  external PromiseJsImpl linkWithRedirect(AuthProviderJsImpl provider);

  external PromiseJsImpl reauthenticateWithCredential(
      OAuthCredential credential);
  external PromiseJsImpl<ConfirmationResultJsImpl>
      reauthenticateWithPhoneNumber(
          String phoneNumber, ApplicationVerifierJsImpl applicationVerifier);
  external PromiseJsImpl<UserCredentialJsImpl> reauthenticateWithPopup(
      AuthProviderJsImpl provider);
  external PromiseJsImpl reauthenticateWithRedirect(
      AuthProviderJsImpl provider);
  external PromiseJsImpl reload();
  external PromiseJsImpl sendEmailVerification(
      [ActionCodeSettings actionCodeSettings]);
  external PromiseJsImpl<UserJsImpl> unlink(String providerId);
  external PromiseJsImpl updateEmail(String newEmail);
  external PromiseJsImpl updatePassword(String newPassword);
  external PromiseJsImpl updatePhoneNumber(OAuthCredential phoneCredential);
  external PromiseJsImpl updateProfile(UserProfile profile);
  external Object toJSON();
}

@anonymous
@JS()
abstract class UserInfoJsImpl {
  external String get displayName;
  external String get email;
  external String get phoneNumber;
  external String get photoURL;
  external String get providerId;
  external String get uid;
}

/// FirebaseError is a subclass of the standard Error object.
/// In addition to a message string, it contains a string-valued code.
///
/// See: <https://firebase.google.com/docs/reference/js/firebase.FirebaseError>.
@JS()
abstract class FirebaseError {
  external String get code;
  external String get message;
  external String get name;
  external String get stack;

  /// Not part of the core JS API, but occasionally exposed in error objects.
  external Object get serverResponse;
}

/// A structure for [User]'s user profile.
@JS()
@anonymous
class UserProfile {
  external String get displayName;
  external set displayName(String s);
  external String get photoURL;
  external set photoURL(String s);

  external factory UserProfile({String displayName, String photoURL});
}

/// A structure for options provided to Firebase.
@JS()
@anonymous
class FirebaseOptions {
  external String get apiKey;
  external set apiKey(String s);
  external String get authDomain;
  external set authDomain(String s);
  external String get databaseURL;
  external set databaseURL(String s);
  external String get projectId;
  external set projectId(String s);
  external String get storageBucket;
  external set storageBucket(String s);
  external String get messagingSenderId;
  external set messagingSenderId(String s);

  external factory FirebaseOptions(
      {String apiKey,
      String authDomain,
      String databaseURL,
      String projectId,
      String storageBucket,
      String messagingSenderId});
}
