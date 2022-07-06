// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';

import 'package:shopest/core/error/failure.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params? params);
}
 