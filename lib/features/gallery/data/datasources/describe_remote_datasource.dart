import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopest/core/network/client_service.dart';
import 'package:shopest/features/gallery/data/models/describe.dart';

part 'describe_remote_datasource.g.dart';

@RestApi(
    baseUrl: 'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5/',)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('')
  Future<DescribeModel> getDescribe();
}

abstract class DescribeRemoteDataSource {
  Future<DescribeModel> getDescribe();
  Future<DescribeModel> getDescribeOfExactPhone(String id);
}

class DescribeRemoteDataSourceImpl extends DescribeRemoteDataSource {
  ClientService client;
  DescribeRemoteDataSourceImpl(this.client);

  @override
  Future<DescribeModel> getDescribe() async {
   
   /* Response<dynamic> response;
    response = await client.get(_path);
    DescribeModel describe;
    Map<String, dynamic> responseBody = response.data;
    describe = DescribeModel.fromJson(responseBody); */
    
    return RestClient(client.dio).getDescribe();
  }

  @override
  Future<DescribeModel> getDescribeOfExactPhone(String id) {

    throw UnimplementedError();
  }
}
