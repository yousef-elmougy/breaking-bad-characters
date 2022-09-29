import 'package:breaking_bad/core/constants/strings.dart';
import 'package:dio/dio.dart';

class Services {
  Dio? dio;

  Services() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List> getCharacterData() async {
    try {
      Response? response = await dio?.get('characters');
      print(response?.data);
      return response?.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

}
