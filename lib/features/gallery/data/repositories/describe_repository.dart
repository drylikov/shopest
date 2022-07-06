import 'package:dartz/dartz.dart';
import 'package:shopest/core/error/exception.dart';
import 'package:shopest/core/error/failure.dart';
import 'package:shopest/features/gallery/data/datasources/describe_local_datasource.dart';
import 'package:shopest/features/gallery/data/datasources/describe_remote_datasource.dart';
import 'package:shopest/features/gallery/data/models/describe.dart';
import 'package:shopest/features/gallery/domain/repositories/describe_repository.dart';

class DescribeRepositoryImpl implements DescribeRepository {
  DescribeRemoteDataSource dataSource;
  DescribeLocalDataSource localDataSource;
  DescribeRepositoryImpl(this.dataSource, this.localDataSource);

  @override
  Future<Either<Failure, DescribeModel>> getDescribe() async {
    return  _getDescribe(() {
      return dataSource.getDescribe();
    });
  }

  @override
  Future<Either<Failure, DescribeModel>> getDescribeOfExactPhone(
      String id,) async {
    return  _getDescribeOfExactPhone(
      () {
        return dataSource.getDescribeOfExactPhone(id);
      },
      id,
    );
  }

  Future<Either<Failure, DescribeModel>> _getDescribe(
      Future<DescribeModel> Function() getDescribe,) async {
    DescribeModel? model;
    try {
      model = await localDataSource.getDescribe();
      if (model == null) {
        model = await dataSource.getDescribe();
        localDataSource.casheDescribe(model.toMap());
      }
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, DescribeModel>> _getDescribeOfExactPhone(
      Future<DescribeModel> Function() getDescribeOfExactPhone,
      String id,) async {
    try {
      final model = await dataSource.getDescribeOfExactPhone(id);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
