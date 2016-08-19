@TestOn('browser')
import 'package:firebase3/firebase.dart';
import 'package:firebase3/src/assets/assets.dart';
import 'package:test/test.dart';

void main() {
  App app;

  setUpAll(() async {
    await config();
  });

  setUp(() async {
    app = initializeApp(
        apiKey: apiKey,
        authDomain: authDomain,
        databaseURL: databaseUrl,
        storageBucket: storageBucket);
  });

  tearDown(() async {
    if (app != null) {
      await app.delete();
      app = null;
    }
  });

  group('providers', () {
    group('Email', () {
      test('PROVIDER_ID', () {
        expect(EmailAuthProvider.PROVIDER_ID, 'password');
      });
      test('instance', () {
        var provider = new EmailAuthProvider();
        expect(provider.providerId, EmailAuthProvider.PROVIDER_ID);
      });
      test('credential', () {
        var cred = EmailAuthProvider.credential('un', 'pw');
        expect(cred.provider, equals(EmailAuthProvider.PROVIDER_ID));
      });
    });

    group('Facebook', () {
      test('PROVIDER_ID', () {
        expect(FacebookAuthProvider.PROVIDER_ID, 'facebook.com');
      });
      test('instance', () {
        var provider = new FacebookAuthProvider();
        expect(provider.providerId, FacebookAuthProvider.PROVIDER_ID);
      });
      test('credential', () {
        var cred = FacebookAuthProvider.credential('token');
        expect(cred.provider, equals(FacebookAuthProvider.PROVIDER_ID));
      });
    });

    group('GitHub', () {
      test('PROVIDER_ID', () {
        expect(GithubAuthProvider.PROVIDER_ID, 'github.com');
      });
      test('instance', () {
        var provider = new GithubAuthProvider();
        expect(provider.providerId, GithubAuthProvider.PROVIDER_ID);
      });
      test('credential', () {
        var cred = GithubAuthProvider.credential('token');
        expect(cred.provider, equals(GithubAuthProvider.PROVIDER_ID));
      });
    });

    group('Google', () {
      test('PROVIDER_ID', () {
        expect(GoogleAuthProvider.PROVIDER_ID, 'google.com');
      });
      test('instance', () {
        var provider = new GoogleAuthProvider();
        expect(provider.providerId, GoogleAuthProvider.PROVIDER_ID);
      });
      test('credential', () {
        var cred = GoogleAuthProvider.credential('idToken', 'accessToken');
        expect(cred.provider, equals(GoogleAuthProvider.PROVIDER_ID));
      });
    });

    group('Twitter', () {
      test('PROVIDER_ID', () {
        expect(TwitterAuthProvider.PROVIDER_ID, 'twitter.com');
      });
      test('instance', () {
        var provider = new TwitterAuthProvider();
        expect(provider.providerId, TwitterAuthProvider.PROVIDER_ID);
      });
      test('credential', () {
        var cred = TwitterAuthProvider.credential('token', 'secret');
        expect(cred.provider, equals(TwitterAuthProvider.PROVIDER_ID));
      });
    });
  });

  group('anonymous user', () {
    Auth authValue;
    User user;
    setUp(() async {
      authValue = auth();
      expect(authValue.currentUser, isNull);

      try {
        user = await authValue.signInAnonymously();
      } on FirebaseError catch (e) {
        print([e.name, e.code, e.message, e.stack]
            .where((s) => s != null)
            .join('\n'));
        rethrow;
      }
    });

    test('properties', () {
      expect(user.isAnonymous, isTrue);
      expect(user.emailVerified, isFalse);
      expect(user.providerData, isEmpty);
      expect(user.providerId, 'firebase');
    });

    test('delete', () async {
      await user.delete();
      expect(authValue.currentUser, isNull);

      try {
        await user.delete();
        fail('user.delete should throw');
      } on FirebaseError catch (e) {
        expect(e.code, 'auth/app-deleted');
      } catch (e) {
        fail('Should have been a FirebaseError');
      }
    });
  });
}
