import 'package:dartz/dartz.dart';
import 'package:shopest/core/error/failure.dart';
import 'package:shopest/features/gallery/data/models/describe.dart';

abstract class DescribeRepository {
  Future<Either<Failure, DescribeModel>> getDescribe();
  Future<Either<Failure, DescribeModel>> getDescribeOfExactPhone(String id);
}
