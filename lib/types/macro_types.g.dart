// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'macro_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$playAudio _$$playAudioFromJson(Map<String, dynamic> json) => _$playAudio(
      _$recordConvert(
        json['action'],
        ($jsonValue) => (
          audioPath: $jsonValue['audioPath'] as String,
          type: $jsonValue['type'] as String,
        ),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$playAudioToJson(_$playAudio instance) =>
    <String, dynamic>{
      'action': {
        'audioPath': instance.action.audioPath,
        'type': instance.action.type,
      },
      'runtimeType': instance.$type,
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as dynamic);

_$modifyVolume _$$modifyVolumeFromJson(Map<String, dynamic> json) =>
    _$modifyVolume(
      _$recordConvert(
        json['action'],
        ($jsonValue) => (
          smoothing: $jsonValue['smoothing'] as num,
          type: $jsonValue['type'] as String,
          volume: $jsonValue['volume'] as num,
        ),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$modifyVolumeToJson(_$modifyVolume instance) =>
    <String, dynamic>{
      'action': {
        'smoothing': instance.action.smoothing,
        'type': instance.action.type,
        'volume': instance.action.volume,
      },
      'runtimeType': instance.$type,
    };

_$modifyBrightness _$$modifyBrightnessFromJson(Map<String, dynamic> json) =>
    _$modifyBrightness(
      _$recordConvert(
        json['action'],
        ($jsonValue) =>
            (brightness: ($jsonValue['brightness'] as num).toDouble(),),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$modifyBrightnessToJson(_$modifyBrightness instance) =>
    <String, dynamic>{
      'action': {
        'brightness': instance.action.brightness,
      },
      'runtimeType': instance.$type,
    };

_$keybound _$$keyboundFromJson(Map<String, dynamic> json) => _$keybound(
      _$recordConvert(
        json['macro'],
        ($jsonValue) => (
          data: _$recordConvert(
            $jsonValue['data'],
            ($jsonValue) => (
              actionSequence: ($jsonValue['actionSequence'] as List<dynamic>?)
                  ?.map((e) => MacroAction.fromJson(e as Map<String, dynamic>))
                  .toList(),
              description: $jsonValue['description'] as String,
              name: $jsonValue['name'] as String,
              type: $enumDecode(_$MacroTypeEnumMap, $jsonValue['type']),
            ),
          ),
          metadata: _$recordConvert(
            $jsonValue['metadata'],
            ($jsonValue) => (
              keys: ($jsonValue['keys'] as List<dynamic>)
                  .map((e) => e as String)
                  .toList(),
            ),
          ),
        ),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$keyboundToJson(_$keybound instance) =>
    <String, dynamic>{
      'macro': {
        'data': {
          'actionSequence': instance.macro.data.actionSequence,
          'description': instance.macro.data.description,
          'name': instance.macro.data.name,
          'type': _$MacroTypeEnumMap[instance.macro.data.type]!,
        },
        'metadata': {
          'keys': instance.macro.metadata.keys,
        },
      },
      'runtimeType': instance.$type,
    };

const _$MacroTypeEnumMap = {
  MacroType.periodic: 'periodic',
  MacroType.keybound: 'keybound',
};

_$periodic _$$periodicFromJson(Map<String, dynamic> json) => _$periodic(
      _$recordConvert(
        json['macro'],
        ($jsonValue) => (
          data: _$recordConvert(
            $jsonValue['data'],
            ($jsonValue) => (
              actionSequence: ($jsonValue['actionSequence'] as List<dynamic>?)
                  ?.map((e) => MacroAction.fromJson(e as Map<String, dynamic>))
                  .toList(),
              description: $jsonValue['description'] as String,
              name: $jsonValue['name'] as String,
              type: $enumDecode(_$MacroTypeEnumMap, $jsonValue['type']),
            ),
          ),
          metadata: _$recordConvert(
            $jsonValue['metadata'],
            ($jsonValue) => (
              day: ($jsonValue['day'] as List<dynamic>)
                  .map((e) => e as int)
                  .toList(),
              hour: $jsonValue['hour'] as int,
              minute: $jsonValue['minute'] as int,
            ),
          ),
        ),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$periodicToJson(_$periodic instance) =>
    <String, dynamic>{
      'macro': {
        'data': {
          'actionSequence': instance.macro.data.actionSequence,
          'description': instance.macro.data.description,
          'name': instance.macro.data.name,
          'type': _$MacroTypeEnumMap[instance.macro.data.type]!,
        },
        'metadata': {
          'day': instance.macro.metadata.day,
          'hour': instance.macro.metadata.hour,
          'minute': instance.macro.metadata.minute,
        },
      },
      'runtimeType': instance.$type,
    };
