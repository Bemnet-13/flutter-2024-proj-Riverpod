// Mocks generated by Mockito 5.4.4 from annotations
// in FantasyE/test/infrastructure/leagues/api_client.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:FantasyE/domain/leagues/league.dart' as _i6;
import 'package:FantasyE/infrastructure/leagues/api_client.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i2;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFlutterSecureStorage_0 extends _i1.SmartFake
    implements _i2.FlutterSecureStorage {
  _FakeFlutterSecureStorage_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUri_1 extends _i1.SmartFake implements Uri {
  _FakeUri_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i3.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiClient extends _i1.Mock implements _i4.ApiClient {
  MockApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FlutterSecureStorage get token => (super.noSuchMethod(
        Invocation.getter(#token),
        returnValue: _FakeFlutterSecureStorage_0(
          this,
          Invocation.getter(#token),
        ),
      ) as _i2.FlutterSecureStorage);

  @override
  Uri get url => (super.noSuchMethod(
        Invocation.getter(#url),
        returnValue: _FakeUri_1(
          this,
          Invocation.getter(#url),
        ),
      ) as Uri);

  @override
  _i5.Future<_i3.Response> getAllLeaguesFromDb() => (super.noSuchMethod(
        Invocation.method(
          #getAllLeaguesFromDb,
          [],
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #getAllLeaguesFromDb,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> createLeague(_i6.League? league) =>
      (super.noSuchMethod(
        Invocation.method(
          #createLeague,
          [league],
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #createLeague,
            [league],
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> updateLeague(_i6.League? league) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateLeague,
          [league],
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #updateLeague,
            [league],
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> deleteLeague(_i6.League? league) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteLeague,
          [league],
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #deleteLeague,
            [league],
          ),
        )),
      ) as _i5.Future<_i3.Response>);
}
