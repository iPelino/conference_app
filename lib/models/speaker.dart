import 'package:json_annotation/json_annotation.dart';

part 'speaker.g.dart';

@JsonSerializable()
class Speaker {
  String id;

  @JsonKey(name: 'first_name')
  String firstName;

  @JsonKey(name: 'last_name')
  String lastName;

  String? imageUrl;

  Speaker({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.imageUrl,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);
  Map<String, dynamic> toJson() => _$SpeakerToJson(this);
}
