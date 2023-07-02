import 'package:freezed_annotation/freezed_annotation.dart';

part 'macro_types.freezed.dart';
part 'macro_types.g.dart';

enum ActionType {playAudio, modifyVolume, modifyBrightness}

enum MacroType {periodic, keybound}

typedef MacroPlayAudioAction = ({
	String type,
	String audioPath
});

typedef MacroModifyVolumeAction = ({
	String type,
	num volume,
	num smoothing
});

typedef MacroModifyBrightnessAction = ({
    double brightness
});

@freezed
sealed class MacroAction with _$MacroAction {
	const factory MacroAction.playAudio(MacroPlayAudioAction action) = playAudio;
	const factory MacroAction.modifyVolume(MacroModifyVolumeAction action) = modifyVolume;
    const factory MacroAction.modifyBrightness(MacroModifyBrightnessAction action) = modifyBrightness;

    factory MacroAction.fromJson(Map<dynamic, dynamic> json) => _$MacroActionFromJson(Map<String, dynamic>.from(json));
}

typedef BaseMacroData = ({
	String name,
	String description,
	List<MacroAction>? actionSequence,
	MacroType type
});

typedef KeyboundMacroStruct = ({
	BaseMacroData data,
	({
		List<String> keys
	}) metadata
});

typedef PeriodicMacroStruct = ({
	BaseMacroData data,
	({
		List<int> day,
		int hour,
		int minute
	}) metadata
});

@freezed
sealed class MacroStruct with _$MacroStruct {
	const factory MacroStruct.keybound(KeyboundMacroStruct macro) = keybound;
	const factory MacroStruct.periodic(PeriodicMacroStruct macro) = periodic;

    factory MacroStruct.fromJson(Map<String, dynamic> json) => _$MacroStructFromJson(json);
}