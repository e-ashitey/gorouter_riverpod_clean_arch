import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_model.freezed.dart';
part 'quotes_model.g.dart';

@freezed
class QuotesModel with _$QuotesModel {
  const factory QuotesModel({
    @Default([]) List<Quotes> quotes,
    @Default(0) int total,
    @Default(0) int skip,
    @Default(0) int limit,
  }) = _QuotesModel;

  factory QuotesModel.fromJson(Map<String, dynamic> json) =>
      _$QuotesModelFromJson(json);
}

@freezed
class Quotes with _$Quotes {
  const factory Quotes({
    required int id,
    required String quote,
    required String author,
  }) = _Quotes;

  factory Quotes.fromJson(Map<String, dynamic> json) => _$QuotesFromJson(json);
}
