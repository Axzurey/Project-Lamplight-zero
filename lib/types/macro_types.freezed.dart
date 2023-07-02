// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'macro_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MacroAction _$MacroActionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'playAudio':
      return playAudio.fromJson(json);
    case 'modifyVolume':
      return modifyVolume.fromJson(json);
    case 'modifyBrightness':
      return modifyBrightness.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MacroAction',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MacroAction {
  Record get action => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(({String audioPath, String type}) action)
        playAudio,
    required TResult Function(({num smoothing, String type, num volume}) action)
        modifyVolume,
    required TResult Function(({double brightness}) action) modifyBrightness,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(({String audioPath, String type}) action)? playAudio,
    TResult? Function(({num smoothing, String type, num volume}) action)?
        modifyVolume,
    TResult? Function(({double brightness}) action)? modifyBrightness,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(({String audioPath, String type}) action)? playAudio,
    TResult Function(({num smoothing, String type, num volume}) action)?
        modifyVolume,
    TResult Function(({double brightness}) action)? modifyBrightness,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(playAudio value) playAudio,
    required TResult Function(modifyVolume value) modifyVolume,
    required TResult Function(modifyBrightness value) modifyBrightness,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(playAudio value)? playAudio,
    TResult? Function(modifyVolume value)? modifyVolume,
    TResult? Function(modifyBrightness value)? modifyBrightness,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(playAudio value)? playAudio,
    TResult Function(modifyVolume value)? modifyVolume,
    TResult Function(modifyBrightness value)? modifyBrightness,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MacroActionCopyWith<$Res> {
  factory $MacroActionCopyWith(
          MacroAction value, $Res Function(MacroAction) then) =
      _$MacroActionCopyWithImpl<$Res, MacroAction>;
}

/// @nodoc
class _$MacroActionCopyWithImpl<$Res, $Val extends MacroAction>
    implements $MacroActionCopyWith<$Res> {
  _$MacroActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$playAudioCopyWith<$Res> {
  factory _$$playAudioCopyWith(
          _$playAudio value, $Res Function(_$playAudio) then) =
      __$$playAudioCopyWithImpl<$Res>;
  @useResult
  $Res call({({String audioPath, String type}) action});
}

/// @nodoc
class __$$playAudioCopyWithImpl<$Res>
    extends _$MacroActionCopyWithImpl<$Res, _$playAudio>
    implements _$$playAudioCopyWith<$Res> {
  __$$playAudioCopyWithImpl(
      _$playAudio _value, $Res Function(_$playAudio) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$playAudio(
      null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ({String audioPath, String type}),
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$playAudio implements playAudio {
  const _$playAudio(this.action, {final String? $type})
      : $type = $type ?? 'playAudio';

  factory _$playAudio.fromJson(Map<String, dynamic> json) =>
      _$$playAudioFromJson(json);

  @override
  final ({String audioPath, String type}) action;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MacroAction.playAudio(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$playAudio &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$playAudioCopyWith<_$playAudio> get copyWith =>
      __$$playAudioCopyWithImpl<_$playAudio>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(({String audioPath, String type}) action)
        playAudio,
    required TResult Function(({num smoothing, String type, num volume}) action)
        modifyVolume,
    required TResult Function(({double brightness}) action) modifyBrightness,
  }) {
    return playAudio(action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(({String audioPath, String type}) action)? playAudio,
    TResult? Function(({num smoothing, String type, num volume}) action)?
        modifyVolume,
    TResult? Function(({double brightness}) action)? modifyBrightness,
  }) {
    return playAudio?.call(action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(({String audioPath, String type}) action)? playAudio,
    TResult Function(({num smoothing, String type, num volume}) action)?
        modifyVolume,
    TResult Function(({double brightness}) action)? modifyBrightness,
    required TResult orElse(),
  }) {
    if (playAudio != null) {
      return playAudio(action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(playAudio value) playAudio,
    required TResult Function(modifyVolume value) modifyVolume,
    required TResult Function(modifyBrightness value) modifyBrightness,
  }) {
    return playAudio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(playAudio value)? playAudio,
    TResult? Function(modifyVolume value)? modifyVolume,
    TResult? Function(modifyBrightness value)? modifyBrightness,
  }) {
    return playAudio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(playAudio value)? playAudio,
    TResult Function(modifyVolume value)? modifyVolume,
    TResult Function(modifyBrightness value)? modifyBrightness,
    required TResult orElse(),
  }) {
    if (playAudio != null) {
      return playAudio(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$playAudioToJson(
      this,
    );
  }
}

abstract class playAudio implements MacroAction {
  const factory playAudio(final ({String audioPath, String type}) action) =
      _$playAudio;

  factory playAudio.fromJson(Map<String, dynamic> json) = _$playAudio.fromJson;

  @override
  ({String audioPath, String type}) get action;
  @JsonKey(ignore: true)
  _$$playAudioCopyWith<_$playAudio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$modifyVolumeCopyWith<$Res> {
  factory _$$modifyVolumeCopyWith(
          _$modifyVolume value, $Res Function(_$modifyVolume) then) =
      __$$modifyVolumeCopyWithImpl<$Res>;
  @useResult
  $Res call({({num smoothing, String type, num volume}) action});
}

/// @nodoc
class __$$modifyVolumeCopyWithImpl<$Res>
    extends _$MacroActionCopyWithImpl<$Res, _$modifyVolume>
    implements _$$modifyVolumeCopyWith<$Res> {
  __$$modifyVolumeCopyWithImpl(
      _$modifyVolume _value, $Res Function(_$modifyVolume) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$modifyVolume(
      null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ({num smoothing, String type, num volume}),
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$modifyVolume implements modifyVolume {
  const _$modifyVolume(this.action, {final String? $type})
      : $type = $type ?? 'modifyVolume';

  factory _$modifyVolume.fromJson(Map<String, dynamic> json) =>
      _$$modifyVolumeFromJson(json);

  @override
  final ({num smoothing, String type, num volume}) action;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MacroAction.modifyVolume(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$modifyVolume &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$modifyVolumeCopyWith<_$modifyVolume> get copyWith =>
      __$$modifyVolumeCopyWithImpl<_$modifyVolume>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(({String audioPath, String type}) action)
        playAudio,
    required TResult Function(({num smoothing, String type, num volume}) action)
        modifyVolume,
    required TResult Function(({double brightness}) action) modifyBrightness,
  }) {
    return modifyVolume(action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(({String audioPath, String type}) action)? playAudio,
    TResult? Function(({num smoothing, String type, num volume}) action)?
        modifyVolume,
    TResult? Function(({double brightness}) action)? modifyBrightness,
  }) {
    return modifyVolume?.call(action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(({String audioPath, String type}) action)? playAudio,
    TResult Function(({num smoothing, String type, num volume}) action)?
        modifyVolume,
    TResult Function(({double brightness}) action)? modifyBrightness,
    required TResult orElse(),
  }) {
    if (modifyVolume != null) {
      return modifyVolume(action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(playAudio value) playAudio,
    required TResult Function(modifyVolume value) modifyVolume,
    required TResult Function(modifyBrightness value) modifyBrightness,
  }) {
    return modifyVolume(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(playAudio value)? playAudio,
    TResult? Function(modifyVolume value)? modifyVolume,
    TResult? Function(modifyBrightness value)? modifyBrightness,
  }) {
    return modifyVolume?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(playAudio value)? playAudio,
    TResult Function(modifyVolume value)? modifyVolume,
    TResult Function(modifyBrightness value)? modifyBrightness,
    required TResult orElse(),
  }) {
    if (modifyVolume != null) {
      return modifyVolume(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$modifyVolumeToJson(
      this,
    );
  }
}

abstract class modifyVolume implements MacroAction {
  const factory modifyVolume(
      final ({num smoothing, String type, num volume}) action) = _$modifyVolume;

  factory modifyVolume.fromJson(Map<String, dynamic> json) =
      _$modifyVolume.fromJson;

  @override
  ({num smoothing, String type, num volume}) get action;
  @JsonKey(ignore: true)
  _$$modifyVolumeCopyWith<_$modifyVolume> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$modifyBrightnessCopyWith<$Res> {
  factory _$$modifyBrightnessCopyWith(
          _$modifyBrightness value, $Res Function(_$modifyBrightness) then) =
      __$$modifyBrightnessCopyWithImpl<$Res>;
  @useResult
  $Res call({({double brightness}) action});
}

/// @nodoc
class __$$modifyBrightnessCopyWithImpl<$Res>
    extends _$MacroActionCopyWithImpl<$Res, _$modifyBrightness>
    implements _$$modifyBrightnessCopyWith<$Res> {
  __$$modifyBrightnessCopyWithImpl(
      _$modifyBrightness _value, $Res Function(_$modifyBrightness) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$modifyBrightness(
      null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ({double brightness}),
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$modifyBrightness implements modifyBrightness {
  const _$modifyBrightness(this.action, {final String? $type})
      : $type = $type ?? 'modifyBrightness';

  factory _$modifyBrightness.fromJson(Map<String, dynamic> json) =>
      _$$modifyBrightnessFromJson(json);

  @override
  final ({double brightness}) action;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MacroAction.modifyBrightness(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$modifyBrightness &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$modifyBrightnessCopyWith<_$modifyBrightness> get copyWith =>
      __$$modifyBrightnessCopyWithImpl<_$modifyBrightness>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(({String audioPath, String type}) action)
        playAudio,
    required TResult Function(({num smoothing, String type, num volume}) action)
        modifyVolume,
    required TResult Function(({double brightness}) action) modifyBrightness,
  }) {
    return modifyBrightness(action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(({String audioPath, String type}) action)? playAudio,
    TResult? Function(({num smoothing, String type, num volume}) action)?
        modifyVolume,
    TResult? Function(({double brightness}) action)? modifyBrightness,
  }) {
    return modifyBrightness?.call(action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(({String audioPath, String type}) action)? playAudio,
    TResult Function(({num smoothing, String type, num volume}) action)?
        modifyVolume,
    TResult Function(({double brightness}) action)? modifyBrightness,
    required TResult orElse(),
  }) {
    if (modifyBrightness != null) {
      return modifyBrightness(action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(playAudio value) playAudio,
    required TResult Function(modifyVolume value) modifyVolume,
    required TResult Function(modifyBrightness value) modifyBrightness,
  }) {
    return modifyBrightness(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(playAudio value)? playAudio,
    TResult? Function(modifyVolume value)? modifyVolume,
    TResult? Function(modifyBrightness value)? modifyBrightness,
  }) {
    return modifyBrightness?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(playAudio value)? playAudio,
    TResult Function(modifyVolume value)? modifyVolume,
    TResult Function(modifyBrightness value)? modifyBrightness,
    required TResult orElse(),
  }) {
    if (modifyBrightness != null) {
      return modifyBrightness(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$modifyBrightnessToJson(
      this,
    );
  }
}

abstract class modifyBrightness implements MacroAction {
  const factory modifyBrightness(final ({double brightness}) action) =
      _$modifyBrightness;

  factory modifyBrightness.fromJson(Map<String, dynamic> json) =
      _$modifyBrightness.fromJson;

  @override
  ({double brightness}) get action;
  @JsonKey(ignore: true)
  _$$modifyBrightnessCopyWith<_$modifyBrightness> get copyWith =>
      throw _privateConstructorUsedError;
}

MacroStruct _$MacroStructFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'keybound':
      return keybound.fromJson(json);
    case 'periodic':
      return periodic.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MacroStruct',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MacroStruct {
  ({
    ({
      List<MacroAction>? actionSequence,
      String description,
      String name,
      MacroType type
    }) data,
    Record metadata
  }) get macro => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<String> keys}) metadata
            }) macro)
        keybound,
    required TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<int> day, int hour, int minute}) metadata
            }) macro)
        periodic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<String> keys}) metadata
            }) macro)?
        keybound,
    TResult? Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<int> day, int hour, int minute}) metadata
            }) macro)?
        periodic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<String> keys}) metadata
            }) macro)?
        keybound,
    TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<int> day, int hour, int minute}) metadata
            }) macro)?
        periodic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(keybound value) keybound,
    required TResult Function(periodic value) periodic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(keybound value)? keybound,
    TResult? Function(periodic value)? periodic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(keybound value)? keybound,
    TResult Function(periodic value)? periodic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MacroStructCopyWith<$Res> {
  factory $MacroStructCopyWith(
          MacroStruct value, $Res Function(MacroStruct) then) =
      _$MacroStructCopyWithImpl<$Res, MacroStruct>;
}

/// @nodoc
class _$MacroStructCopyWithImpl<$Res, $Val extends MacroStruct>
    implements $MacroStructCopyWith<$Res> {
  _$MacroStructCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$keyboundCopyWith<$Res> {
  factory _$$keyboundCopyWith(
          _$keybound value, $Res Function(_$keybound) then) =
      __$$keyboundCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {({
        ({
          List<MacroAction>? actionSequence,
          String description,
          String name,
          MacroType type
        }) data,
        ({List<String> keys}) metadata
      }) macro});
}

/// @nodoc
class __$$keyboundCopyWithImpl<$Res>
    extends _$MacroStructCopyWithImpl<$Res, _$keybound>
    implements _$$keyboundCopyWith<$Res> {
  __$$keyboundCopyWithImpl(_$keybound _value, $Res Function(_$keybound) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macro = null,
  }) {
    return _then(_$keybound(
      null == macro
          ? _value.macro
          : macro // ignore: cast_nullable_to_non_nullable
              as ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<String> keys}) metadata
            }),
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$keybound implements keybound {
  const _$keybound(this.macro, {final String? $type})
      : $type = $type ?? 'keybound';

  factory _$keybound.fromJson(Map<String, dynamic> json) =>
      _$$keyboundFromJson(json);

  @override
  final ({
    ({
      List<MacroAction>? actionSequence,
      String description,
      String name,
      MacroType type
    }) data,
    ({List<String> keys}) metadata
  }) macro;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MacroStruct.keybound(macro: $macro)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$keybound &&
            (identical(other.macro, macro) || other.macro == macro));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, macro);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$keyboundCopyWith<_$keybound> get copyWith =>
      __$$keyboundCopyWithImpl<_$keybound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<String> keys}) metadata
            }) macro)
        keybound,
    required TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<int> day, int hour, int minute}) metadata
            }) macro)
        periodic,
  }) {
    return keybound(macro);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<String> keys}) metadata
            }) macro)?
        keybound,
    TResult? Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<int> day, int hour, int minute}) metadata
            }) macro)?
        periodic,
  }) {
    return keybound?.call(macro);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<String> keys}) metadata
            }) macro)?
        keybound,
    TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<int> day, int hour, int minute}) metadata
            }) macro)?
        periodic,
    required TResult orElse(),
  }) {
    if (keybound != null) {
      return keybound(macro);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(keybound value) keybound,
    required TResult Function(periodic value) periodic,
  }) {
    return keybound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(keybound value)? keybound,
    TResult? Function(periodic value)? periodic,
  }) {
    return keybound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(keybound value)? keybound,
    TResult Function(periodic value)? periodic,
    required TResult orElse(),
  }) {
    if (keybound != null) {
      return keybound(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$keyboundToJson(
      this,
    );
  }
}

abstract class keybound implements MacroStruct {
  const factory keybound(
      final ({
        ({
          List<MacroAction>? actionSequence,
          String description,
          String name,
          MacroType type
        }) data,
        ({List<String> keys}) metadata
      }) macro) = _$keybound;

  factory keybound.fromJson(Map<String, dynamic> json) = _$keybound.fromJson;

  @override
  ({
    ({
      List<MacroAction>? actionSequence,
      String description,
      String name,
      MacroType type
    }) data,
    ({List<String> keys}) metadata
  }) get macro;
  @JsonKey(ignore: true)
  _$$keyboundCopyWith<_$keybound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$periodicCopyWith<$Res> {
  factory _$$periodicCopyWith(
          _$periodic value, $Res Function(_$periodic) then) =
      __$$periodicCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {({
        ({
          List<MacroAction>? actionSequence,
          String description,
          String name,
          MacroType type
        }) data,
        ({List<int> day, int hour, int minute}) metadata
      }) macro});
}

/// @nodoc
class __$$periodicCopyWithImpl<$Res>
    extends _$MacroStructCopyWithImpl<$Res, _$periodic>
    implements _$$periodicCopyWith<$Res> {
  __$$periodicCopyWithImpl(_$periodic _value, $Res Function(_$periodic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macro = null,
  }) {
    return _then(_$periodic(
      null == macro
          ? _value.macro
          : macro // ignore: cast_nullable_to_non_nullable
              as ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<int> day, int hour, int minute}) metadata
            }),
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$periodic implements periodic {
  const _$periodic(this.macro, {final String? $type})
      : $type = $type ?? 'periodic';

  factory _$periodic.fromJson(Map<String, dynamic> json) =>
      _$$periodicFromJson(json);

  @override
  final ({
    ({
      List<MacroAction>? actionSequence,
      String description,
      String name,
      MacroType type
    }) data,
    ({List<int> day, int hour, int minute}) metadata
  }) macro;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MacroStruct.periodic(macro: $macro)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$periodic &&
            (identical(other.macro, macro) || other.macro == macro));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, macro);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$periodicCopyWith<_$periodic> get copyWith =>
      __$$periodicCopyWithImpl<_$periodic>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<String> keys}) metadata
            }) macro)
        keybound,
    required TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<int> day, int hour, int minute}) metadata
            }) macro)
        periodic,
  }) {
    return periodic(macro);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<String> keys}) metadata
            }) macro)?
        keybound,
    TResult? Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<int> day, int hour, int minute}) metadata
            }) macro)?
        periodic,
  }) {
    return periodic?.call(macro);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<String> keys}) metadata
            }) macro)?
        keybound,
    TResult Function(
            ({
              ({
                List<MacroAction>? actionSequence,
                String description,
                String name,
                MacroType type
              }) data,
              ({List<int> day, int hour, int minute}) metadata
            }) macro)?
        periodic,
    required TResult orElse(),
  }) {
    if (periodic != null) {
      return periodic(macro);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(keybound value) keybound,
    required TResult Function(periodic value) periodic,
  }) {
    return periodic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(keybound value)? keybound,
    TResult? Function(periodic value)? periodic,
  }) {
    return periodic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(keybound value)? keybound,
    TResult Function(periodic value)? periodic,
    required TResult orElse(),
  }) {
    if (periodic != null) {
      return periodic(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$periodicToJson(
      this,
    );
  }
}

abstract class periodic implements MacroStruct {
  const factory periodic(
      final ({
        ({
          List<MacroAction>? actionSequence,
          String description,
          String name,
          MacroType type
        }) data,
        ({List<int> day, int hour, int minute}) metadata
      }) macro) = _$periodic;

  factory periodic.fromJson(Map<String, dynamic> json) = _$periodic.fromJson;

  @override
  ({
    ({
      List<MacroAction>? actionSequence,
      String description,
      String name,
      MacroType type
    }) data,
    ({List<int> day, int hour, int minute}) metadata
  }) get macro;
  @JsonKey(ignore: true)
  _$$periodicCopyWith<_$periodic> get copyWith =>
      throw _privateConstructorUsedError;
}
