import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/network/general_failure_model.dart';

abstract class BaseUseCase<T, ParametersClass> {
  Future<Either<GeneralFailureModel, T>> call(ParametersClass parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}
