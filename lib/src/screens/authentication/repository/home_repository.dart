import 'dart:convert';
import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/api_service/api_endpoint.dart';
import '../../../common/api_service/api_provider.dart';
import '../model/vision_response_model.dart';

part 'home_repository.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository(ref,
      client: ref.read(apiProviderRepositoryImplProvider));
}

class HomeRepository {
  HomeRepository(this.ref, {required ApiProviderRepositoryImpl client})
      : _client = client;
  final ApiProviderRepositoryImpl _client;
  final HomeRepositoryRef ref;

  Future<VisionResponseModel> fetchDataVisionAI(Uint8List? dataImage) async {
    if(dataImage == null) return const VisionResponseModel();
    final dataBase = base64Encode(dataImage);
    final param = {
      "requests": [
        {
          "image": {
            "content": dataBase
          },
          "features": [
            {
              "type": "TEXT_DETECTION"
            }
          ]
        }
      ]
    };
    final response = await _client.postRequest(
      AppEndPoints.fetchDataVisionAI.path,
      data: param
    );
    print('DATATATATATATAT = ${response.data}');
    return VisionResponseModel.fromJson(response.data);
  }
}
