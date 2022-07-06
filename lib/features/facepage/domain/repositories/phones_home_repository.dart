import 'package:dartz/dartz.dart';
import 'package:shopest/core/error/failure.dart';
import 'package:shopest/features/facepage/data/models/phone_model.dart';

abstract class PhonesHomeRepository {
  
  Future<Either<Failure,List<PhoneModel>>> getHomeStorePhones();
   Future<Either<Failure,List<PhoneModel>>> getPhonesHomeOfUser(String? identificatorOfUser);

}
