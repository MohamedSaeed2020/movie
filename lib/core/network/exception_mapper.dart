import 'package:movie/core/network/error_model.dart';

class RemoteServerException implements Exception {
  final ErrorModel errorModel;

  const RemoteServerException({
    required this.errorModel,
  });
}

