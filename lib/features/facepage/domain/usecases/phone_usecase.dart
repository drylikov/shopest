import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopest/core/error/failure.dart';
import 'package:shopest/core/usecases/usecases.dart';
import 'package:shopest/features/facepage/domain/entity/phones_entity.dart';
import 'package:shopest/features/facepage/domain/repositories/phones_home_repository.dart';

class GetHomeStorePhones extends UseCases<List<PhonesEntity>, GetHomePhonesParams> {
  final PhonesHomeRepository _phonesHomeRepository;
  GetHomePhonesParams? params;

  GetHomeStorePhones(this._phonesHomeRepository, [this.params]);

  @override
  Future<Either<Failure, List<PhonesEntity>>> call([GetHomePhonesParams? params]) async {
    if (params != null) {
      return  _phonesHomeRepository.getPhonesHomeOfUser(params.identificatorOfUser);
    } else {
      return  _phonesHomeRepository.getHomeStorePhones();
    }
  }
}

class GetHomePhonesParams extends Equatable {
  final String? identificatorOfUser;
  @override
  List<Object?> get props => [identificatorOfUser];
  const GetHomePhonesParams([this.identificatorOfUser]);


}
