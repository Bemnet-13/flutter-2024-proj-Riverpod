// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'league_manager_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LeagueManagerState {
  LeagueName get leagueName => throw _privateConstructorUsedError;
  UniqueId get uniqueId => throw _privateConstructorUsedError;
  List<MemberId> get members => throw _privateConstructorUsedError;
  Option<Either<LeagueFailure, Unit>> get operationFailureOrSuccess =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeagueManagerStateCopyWith<LeagueManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueManagerStateCopyWith<$Res> {
  factory $LeagueManagerStateCopyWith(
          LeagueManagerState value, $Res Function(LeagueManagerState) then) =
      _$LeagueManagerStateCopyWithImpl<$Res, LeagueManagerState>;
  @useResult
  $Res call(
      {LeagueName leagueName,
      UniqueId uniqueId,
      List<MemberId> members,
      Option<Either<LeagueFailure, Unit>> operationFailureOrSuccess,
      bool showErrorMessages});
}

/// @nodoc
class _$LeagueManagerStateCopyWithImpl<$Res, $Val extends LeagueManagerState>
    implements $LeagueManagerStateCopyWith<$Res> {
  _$LeagueManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leagueName = null,
    Object? uniqueId = null,
    Object? members = null,
    Object? operationFailureOrSuccess = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_value.copyWith(
      leagueName: null == leagueName
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as LeagueName,
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberId>,
      operationFailureOrSuccess: null == operationFailureOrSuccess
          ? _value.operationFailureOrSuccess
          : operationFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<LeagueFailure, Unit>>,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeagueManagerStateImplCopyWith<$Res>
    implements $LeagueManagerStateCopyWith<$Res> {
  factory _$$LeagueManagerStateImplCopyWith(_$LeagueManagerStateImpl value,
          $Res Function(_$LeagueManagerStateImpl) then) =
      __$$LeagueManagerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LeagueName leagueName,
      UniqueId uniqueId,
      List<MemberId> members,
      Option<Either<LeagueFailure, Unit>> operationFailureOrSuccess,
      bool showErrorMessages});
}

/// @nodoc
class __$$LeagueManagerStateImplCopyWithImpl<$Res>
    extends _$LeagueManagerStateCopyWithImpl<$Res, _$LeagueManagerStateImpl>
    implements _$$LeagueManagerStateImplCopyWith<$Res> {
  __$$LeagueManagerStateImplCopyWithImpl(_$LeagueManagerStateImpl _value,
      $Res Function(_$LeagueManagerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leagueName = null,
    Object? uniqueId = null,
    Object? members = null,
    Object? operationFailureOrSuccess = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_$LeagueManagerStateImpl(
      leagueName: null == leagueName
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as LeagueName,
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberId>,
      operationFailureOrSuccess: null == operationFailureOrSuccess
          ? _value.operationFailureOrSuccess
          : operationFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<LeagueFailure, Unit>>,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LeagueManagerStateImpl implements _LeagueManagerState {
  const _$LeagueManagerStateImpl(
      {required this.leagueName,
      required this.uniqueId,
      required final List<MemberId> members,
      required this.operationFailureOrSuccess,
      required this.showErrorMessages})
      : _members = members;

  @override
  final LeagueName leagueName;
  @override
  final UniqueId uniqueId;
  final List<MemberId> _members;
  @override
  List<MemberId> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final Option<Either<LeagueFailure, Unit>> operationFailureOrSuccess;
  @override
  final bool showErrorMessages;

  @override
  String toString() {
    return 'LeagueManagerState(leagueName: $leagueName, uniqueId: $uniqueId, members: $members, operationFailureOrSuccess: $operationFailureOrSuccess, showErrorMessages: $showErrorMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeagueManagerStateImpl &&
            (identical(other.leagueName, leagueName) ||
                other.leagueName == leagueName) &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.operationFailureOrSuccess,
                    operationFailureOrSuccess) ||
                other.operationFailureOrSuccess == operationFailureOrSuccess) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      leagueName,
      uniqueId,
      const DeepCollectionEquality().hash(_members),
      operationFailureOrSuccess,
      showErrorMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeagueManagerStateImplCopyWith<_$LeagueManagerStateImpl> get copyWith =>
      __$$LeagueManagerStateImplCopyWithImpl<_$LeagueManagerStateImpl>(
          this, _$identity);
}

abstract class _LeagueManagerState implements LeagueManagerState {
  const factory _LeagueManagerState(
      {required final LeagueName leagueName,
      required final UniqueId uniqueId,
      required final List<MemberId> members,
      required final Option<Either<LeagueFailure, Unit>>
          operationFailureOrSuccess,
      required final bool showErrorMessages}) = _$LeagueManagerStateImpl;

  @override
  LeagueName get leagueName;
  @override
  UniqueId get uniqueId;
  @override
  List<MemberId> get members;
  @override
  Option<Either<LeagueFailure, Unit>> get operationFailureOrSuccess;
  @override
  bool get showErrorMessages;
  @override
  @JsonKey(ignore: true)
  _$$LeagueManagerStateImplCopyWith<_$LeagueManagerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
