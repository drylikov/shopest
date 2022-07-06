
import 'package:dartz/dartz.dart';
import 'package:shopest/core/error/exception.dart';
import 'package:shopest/core/error/failure.dart';
import 'package:shopest/features/facepage/data/datasources/phonehome_local_datasource.dart';
import 'package:shopest/features/facepage/data/datasources/phonehome_remote_datasource.dart';
import 'package:shopest/features/facepage/data/models/phone_model.dart';
import 'package:shopest/features/facepage/domain/repositories/phones_home_repository.dart';

class PhoneHomeRepositoryImpl implements PhonesHomeRepository {
  PhoneHomeRemoteSource dataSource;
  PhoneHomeLocalSource localDataSource;
  PhoneHomeRepositoryImpl(this.dataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<PhoneModel>>> getHomeStorePhones() async {
    return  _getHomeStorePhones(() {
      return dataSource.getHomeStorePhones();
    });
  }

  @override
  Future<Either<Failure, List<PhoneModel>>> getPhonesHomeOfUser(
      String? identificatorOfUser,) async {
    return  _getPhonesHomeOfUser(() {
      return dataSource.getPhonesHomeOfUser(identificatorOfUser!);
    });
  }

  Future<Either<Failure, List<PhoneModel>>> _getHomeStorePhones(
      Future<List<PhoneModel>> Function() getHomeStorePhones,) async {
    List<PhoneModel>? list;
    try {
      // list = await localDataSource.getHomeStorePhones();
   
      if (list == null) {
        try {
          final modelList = await getHomeStorePhones();
          for (final item in modelList) {
            localDataSource.casheHomeStorePhones(item.toMap());
          }

          return Right(modelList);
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        return Right(list);
      }
    } on DatabaseFailure {
      return Left(DatabaseFailure());
    }
    
  }

  Future<Either<Failure, List<PhoneModel>>> _getPhonesHomeOfUser(
      Future<List<PhoneModel>> Function() getPhonesHomeOfUser,) async {
    try {
      final model = await getPhonesHomeOfUser();
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
