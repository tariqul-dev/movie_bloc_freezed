import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
class Exceptions with _$Exceptions implements Exception{
  const factory Exceptions.server({required String message}) = ServerException;
}