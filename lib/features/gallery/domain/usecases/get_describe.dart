import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopest/core/error/failure.dart';
import 'package:shopest/core/usecases/usecases.dart';
import 'package:shopest/features/gallery/data/models/describe.dart';
import 'package:shopest/features/gallery/domain/repositories/describe_repository.dart';

class GetDescribe extends UseCases<DescribeModel, DescribeParams> {
  final DescribeRepository _describeRepository;
  GetDescribe(this._describeRepository);
  @override
  Future<Either<Failure, DescribeModel>> call([DescribeParams? params]) async {
    if (params != null) {
      return  _describeRepository
          .getDescribeOfExactPhone(params.identificatorOfUser!);
    } else {
      return  _describeRepository.getDescribe();
    }
  }
}

class DescribeParams extends Equatable {
  final String? identificatorOfUser;
  @override
  List<Object?> get props => [identificatorOfUser];
  const DescribeParams([this.identificatorOfUser]);


}
