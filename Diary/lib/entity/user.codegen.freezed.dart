// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPrivate _$UserPrivateFromJson(Map<String, dynamic> json) {
  return _UserPrivate.fromJson(json);
}

/// @nodoc
mixin _$UserPrivate {
  String? get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPrivateCopyWith<UserPrivate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPrivateCopyWith<$Res> {
  factory $UserPrivateCopyWith(
          UserPrivate value, $Res Function(UserPrivate) then) =
      _$UserPrivateCopyWithImpl<$Res, UserPrivate>;
  @useResult
  $Res call({String? fcmToken});
}

/// @nodoc
class _$UserPrivateCopyWithImpl<$Res, $Val extends UserPrivate>
    implements $UserPrivateCopyWith<$Res> {
  _$UserPrivateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = freezed,
  }) {
    return _then(_value.copyWith(
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPrivateCopyWith<$Res>
    implements $UserPrivateCopyWith<$Res> {
  factory _$$_UserPrivateCopyWith(
          _$_UserPrivate value, $Res Function(_$_UserPrivate) then) =
      __$$_UserPrivateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? fcmToken});
}

/// @nodoc
class __$$_UserPrivateCopyWithImpl<$Res>
    extends _$UserPrivateCopyWithImpl<$Res, _$_UserPrivate>
    implements _$$_UserPrivateCopyWith<$Res> {
  __$$_UserPrivateCopyWithImpl(
      _$_UserPrivate _value, $Res Function(_$_UserPrivate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = freezed,
  }) {
    return _then(_$_UserPrivate(
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPrivate extends _UserPrivate {
  const _$_UserPrivate({this.fcmToken}) : super._();

  factory _$_UserPrivate.fromJson(Map<String, dynamic> json) =>
      _$$_UserPrivateFromJson(json);

  @override
  final String? fcmToken;

  @override
  String toString() {
    return 'UserPrivate(fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPrivate &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPrivateCopyWith<_$_UserPrivate> get copyWith =>
      __$$_UserPrivateCopyWithImpl<_$_UserPrivate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPrivateToJson(
      this,
    );
  }
}

abstract class _UserPrivate extends UserPrivate {
  const factory _UserPrivate({final String? fcmToken}) = _$_UserPrivate;
  const _UserPrivate._() : super._();

  factory _UserPrivate.fromJson(Map<String, dynamic> json) =
      _$_UserPrivate.fromJson;

  @override
  String? get fcmToken;
  @override
  @JsonKey(ignore: true)
  _$$_UserPrivateCopyWith<_$_UserPrivate> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "settings")
  Setting? get setting => throw _privateConstructorUsedError;
  bool get migratedFlutter => throw _privateConstructorUsedError;
  String? get userIDWhenCreateUser => throw _privateConstructorUsedError;
  String? get anonymousUserID => throw _privateConstructorUsedError;
  List<String> get userDocumentIDSets => throw _privateConstructorUsedError;
  List<String> get anonymousUserIDSets => throw _privateConstructorUsedError;
  List<String> get firebaseCurrentUserIDSets =>
      throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  bool get isTrial => throw _privateConstructorUsedError;
  bool get hasDiscountEntitlement => throw _privateConstructorUsedError;
  bool get shouldAskCancelReason => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  DateTime? get beginTrialDate => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  DateTime? get trialDeadlineDate => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  DateTime? get discountEntitlementDeadlineDate =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: "settings")
          Setting? setting,
      bool migratedFlutter,
      String? userIDWhenCreateUser,
      String? anonymousUserID,
      List<String> userDocumentIDSets,
      List<String> anonymousUserIDSets,
      List<String> firebaseCurrentUserIDSets,
      bool isPremium,
      bool isTrial,
      bool hasDiscountEntitlement,
      bool shouldAskCancelReason,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          DateTime? beginTrialDate,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          DateTime? trialDeadlineDate,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          DateTime? discountEntitlementDeadlineDate});

  $SettingCopyWith<$Res>? get setting;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? setting = freezed,
    Object? migratedFlutter = null,
    Object? userIDWhenCreateUser = freezed,
    Object? anonymousUserID = freezed,
    Object? userDocumentIDSets = null,
    Object? anonymousUserIDSets = null,
    Object? firebaseCurrentUserIDSets = null,
    Object? isPremium = null,
    Object? isTrial = null,
    Object? hasDiscountEntitlement = null,
    Object? shouldAskCancelReason = null,
    Object? beginTrialDate = freezed,
    Object? trialDeadlineDate = freezed,
    Object? discountEntitlementDeadlineDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      setting: freezed == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as Setting?,
      migratedFlutter: null == migratedFlutter
          ? _value.migratedFlutter
          : migratedFlutter // ignore: cast_nullable_to_non_nullable
              as bool,
      userIDWhenCreateUser: freezed == userIDWhenCreateUser
          ? _value.userIDWhenCreateUser
          : userIDWhenCreateUser // ignore: cast_nullable_to_non_nullable
              as String?,
      anonymousUserID: freezed == anonymousUserID
          ? _value.anonymousUserID
          : anonymousUserID // ignore: cast_nullable_to_non_nullable
              as String?,
      userDocumentIDSets: null == userDocumentIDSets
          ? _value.userDocumentIDSets
          : userDocumentIDSets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      anonymousUserIDSets: null == anonymousUserIDSets
          ? _value.anonymousUserIDSets
          : anonymousUserIDSets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      firebaseCurrentUserIDSets: null == firebaseCurrentUserIDSets
          ? _value.firebaseCurrentUserIDSets
          : firebaseCurrentUserIDSets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrial: null == isTrial
          ? _value.isTrial
          : isTrial // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDiscountEntitlement: null == hasDiscountEntitlement
          ? _value.hasDiscountEntitlement
          : hasDiscountEntitlement // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldAskCancelReason: null == shouldAskCancelReason
          ? _value.shouldAskCancelReason
          : shouldAskCancelReason // ignore: cast_nullable_to_non_nullable
              as bool,
      beginTrialDate: freezed == beginTrialDate
          ? _value.beginTrialDate
          : beginTrialDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      trialDeadlineDate: freezed == trialDeadlineDate
          ? _value.trialDeadlineDate
          : trialDeadlineDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      discountEntitlementDeadlineDate: freezed ==
              discountEntitlementDeadlineDate
          ? _value.discountEntitlementDeadlineDate
          : discountEntitlementDeadlineDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingCopyWith<$Res>? get setting {
    if (_value.setting == null) {
      return null;
    }

    return $SettingCopyWith<$Res>(_value.setting!, (value) {
      return _then(_value.copyWith(setting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: "settings")
          Setting? setting,
      bool migratedFlutter,
      String? userIDWhenCreateUser,
      String? anonymousUserID,
      List<String> userDocumentIDSets,
      List<String> anonymousUserIDSets,
      List<String> firebaseCurrentUserIDSets,
      bool isPremium,
      bool isTrial,
      bool hasDiscountEntitlement,
      bool shouldAskCancelReason,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          DateTime? beginTrialDate,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          DateTime? trialDeadlineDate,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          DateTime? discountEntitlementDeadlineDate});

  @override
  $SettingCopyWith<$Res>? get setting;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? setting = freezed,
    Object? migratedFlutter = null,
    Object? userIDWhenCreateUser = freezed,
    Object? anonymousUserID = freezed,
    Object? userDocumentIDSets = null,
    Object? anonymousUserIDSets = null,
    Object? firebaseCurrentUserIDSets = null,
    Object? isPremium = null,
    Object? isTrial = null,
    Object? hasDiscountEntitlement = null,
    Object? shouldAskCancelReason = null,
    Object? beginTrialDate = freezed,
    Object? trialDeadlineDate = freezed,
    Object? discountEntitlementDeadlineDate = freezed,
  }) {
    return _then(_$_User(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      setting: freezed == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as Setting?,
      migratedFlutter: null == migratedFlutter
          ? _value.migratedFlutter
          : migratedFlutter // ignore: cast_nullable_to_non_nullable
              as bool,
      userIDWhenCreateUser: freezed == userIDWhenCreateUser
          ? _value.userIDWhenCreateUser
          : userIDWhenCreateUser // ignore: cast_nullable_to_non_nullable
              as String?,
      anonymousUserID: freezed == anonymousUserID
          ? _value.anonymousUserID
          : anonymousUserID // ignore: cast_nullable_to_non_nullable
              as String?,
      userDocumentIDSets: null == userDocumentIDSets
          ? _value._userDocumentIDSets
          : userDocumentIDSets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      anonymousUserIDSets: null == anonymousUserIDSets
          ? _value._anonymousUserIDSets
          : anonymousUserIDSets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      firebaseCurrentUserIDSets: null == firebaseCurrentUserIDSets
          ? _value._firebaseCurrentUserIDSets
          : firebaseCurrentUserIDSets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrial: null == isTrial
          ? _value.isTrial
          : isTrial // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDiscountEntitlement: null == hasDiscountEntitlement
          ? _value.hasDiscountEntitlement
          : hasDiscountEntitlement // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldAskCancelReason: null == shouldAskCancelReason
          ? _value.shouldAskCancelReason
          : shouldAskCancelReason // ignore: cast_nullable_to_non_nullable
              as bool,
      beginTrialDate: freezed == beginTrialDate
          ? _value.beginTrialDate
          : beginTrialDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      trialDeadlineDate: freezed == trialDeadlineDate
          ? _value.trialDeadlineDate
          : trialDeadlineDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      discountEntitlementDeadlineDate: freezed ==
              discountEntitlementDeadlineDate
          ? _value.discountEntitlementDeadlineDate
          : discountEntitlementDeadlineDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_User extends _User {
  const _$_User(
      {this.id,
      @JsonKey(name: "settings")
          this.setting,
      this.migratedFlutter = false,
      this.userIDWhenCreateUser,
      this.anonymousUserID,
      final List<String> userDocumentIDSets = const [],
      final List<String> anonymousUserIDSets = const [],
      final List<String> firebaseCurrentUserIDSets = const [],
      this.isPremium = false,
      this.isTrial = false,
      this.hasDiscountEntitlement = false,
      this.shouldAskCancelReason = false,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          this.beginTrialDate,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          this.trialDeadlineDate,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          this.discountEntitlementDeadlineDate})
      : _userDocumentIDSets = userDocumentIDSets,
        _anonymousUserIDSets = anonymousUserIDSets,
        _firebaseCurrentUserIDSets = firebaseCurrentUserIDSets,
        super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: "settings")
  final Setting? setting;
  @override
  @JsonKey()
  final bool migratedFlutter;
  @override
  final String? userIDWhenCreateUser;
  @override
  final String? anonymousUserID;
  final List<String> _userDocumentIDSets;
  @override
  @JsonKey()
  List<String> get userDocumentIDSets {
    if (_userDocumentIDSets is EqualUnmodifiableListView)
      return _userDocumentIDSets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userDocumentIDSets);
  }

  final List<String> _anonymousUserIDSets;
  @override
  @JsonKey()
  List<String> get anonymousUserIDSets {
    if (_anonymousUserIDSets is EqualUnmodifiableListView)
      return _anonymousUserIDSets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_anonymousUserIDSets);
  }

  final List<String> _firebaseCurrentUserIDSets;
  @override
  @JsonKey()
  List<String> get firebaseCurrentUserIDSets {
    if (_firebaseCurrentUserIDSets is EqualUnmodifiableListView)
      return _firebaseCurrentUserIDSets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_firebaseCurrentUserIDSets);
  }

  @override
  @JsonKey()
  final bool isPremium;
  @override
  @JsonKey()
  final bool isTrial;
  @override
  @JsonKey()
  final bool hasDiscountEntitlement;
  @override
  @JsonKey()
  final bool shouldAskCancelReason;
  @override
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  final DateTime? beginTrialDate;
  @override
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  final DateTime? trialDeadlineDate;
  @override
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  final DateTime? discountEntitlementDeadlineDate;

  @override
  String toString() {
    return 'User(id: $id, setting: $setting, migratedFlutter: $migratedFlutter, userIDWhenCreateUser: $userIDWhenCreateUser, anonymousUserID: $anonymousUserID, userDocumentIDSets: $userDocumentIDSets, anonymousUserIDSets: $anonymousUserIDSets, firebaseCurrentUserIDSets: $firebaseCurrentUserIDSets, isPremium: $isPremium, isTrial: $isTrial, hasDiscountEntitlement: $hasDiscountEntitlement, shouldAskCancelReason: $shouldAskCancelReason, beginTrialDate: $beginTrialDate, trialDeadlineDate: $trialDeadlineDate, discountEntitlementDeadlineDate: $discountEntitlementDeadlineDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.setting, setting) || other.setting == setting) &&
            (identical(other.migratedFlutter, migratedFlutter) ||
                other.migratedFlutter == migratedFlutter) &&
            (identical(other.userIDWhenCreateUser, userIDWhenCreateUser) ||
                other.userIDWhenCreateUser == userIDWhenCreateUser) &&
            (identical(other.anonymousUserID, anonymousUserID) ||
                other.anonymousUserID == anonymousUserID) &&
            const DeepCollectionEquality()
                .equals(other._userDocumentIDSets, _userDocumentIDSets) &&
            const DeepCollectionEquality()
                .equals(other._anonymousUserIDSets, _anonymousUserIDSets) &&
            const DeepCollectionEquality().equals(
                other._firebaseCurrentUserIDSets, _firebaseCurrentUserIDSets) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.isTrial, isTrial) || other.isTrial == isTrial) &&
            (identical(other.hasDiscountEntitlement, hasDiscountEntitlement) ||
                other.hasDiscountEntitlement == hasDiscountEntitlement) &&
            (identical(other.shouldAskCancelReason, shouldAskCancelReason) ||
                other.shouldAskCancelReason == shouldAskCancelReason) &&
            (identical(other.beginTrialDate, beginTrialDate) ||
                other.beginTrialDate == beginTrialDate) &&
            (identical(other.trialDeadlineDate, trialDeadlineDate) ||
                other.trialDeadlineDate == trialDeadlineDate) &&
            (identical(other.discountEntitlementDeadlineDate,
                    discountEntitlementDeadlineDate) ||
                other.discountEntitlementDeadlineDate ==
                    discountEntitlementDeadlineDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      setting,
      migratedFlutter,
      userIDWhenCreateUser,
      anonymousUserID,
      const DeepCollectionEquality().hash(_userDocumentIDSets),
      const DeepCollectionEquality().hash(_anonymousUserIDSets),
      const DeepCollectionEquality().hash(_firebaseCurrentUserIDSets),
      isPremium,
      isTrial,
      hasDiscountEntitlement,
      shouldAskCancelReason,
      beginTrialDate,
      trialDeadlineDate,
      discountEntitlementDeadlineDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {final String? id,
      @JsonKey(name: "settings")
          final Setting? setting,
      final bool migratedFlutter,
      final String? userIDWhenCreateUser,
      final String? anonymousUserID,
      final List<String> userDocumentIDSets,
      final List<String> anonymousUserIDSets,
      final List<String> firebaseCurrentUserIDSets,
      final bool isPremium,
      final bool isTrial,
      final bool hasDiscountEntitlement,
      final bool shouldAskCancelReason,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          final DateTime? beginTrialDate,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          final DateTime? trialDeadlineDate,
      @JsonKey(fromJson: TimestampConverter.timestampToDateTime, toJson: TimestampConverter.dateTimeToTimestamp)
          final DateTime? discountEntitlementDeadlineDate}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: "settings")
  Setting? get setting;
  @override
  bool get migratedFlutter;
  @override
  String? get userIDWhenCreateUser;
  @override
  String? get anonymousUserID;
  @override
  List<String> get userDocumentIDSets;
  @override
  List<String> get anonymousUserIDSets;
  @override
  List<String> get firebaseCurrentUserIDSets;
  @override
  bool get isPremium;
  @override
  bool get isTrial;
  @override
  bool get hasDiscountEntitlement;
  @override
  bool get shouldAskCancelReason;
  @override
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  DateTime? get beginTrialDate;
  @override
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  DateTime? get trialDeadlineDate;
  @override
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  DateTime? get discountEntitlementDeadlineDate;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
