import 'package:equatable/equatable.dart';

abstract class GeneralFailureModel extends Equatable {
  final String errorMessage;

  const GeneralFailureModel(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class RemoteServerFailure extends GeneralFailureModel {
  const RemoteServerFailure(super.errorMessage);
}

class LocalDatabaseFailure extends GeneralFailureModel {
  const LocalDatabaseFailure(super.errorMessage);
}
