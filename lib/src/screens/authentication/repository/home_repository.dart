import 'dart:convert';
import 'dart:typed_data';

import 'package:http_parser/http_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/api_service/api_endpoint.dart';
import '../../../common/api_service/api_provider.dart';
import '../model/vision_response_model.dart';
import '../screens/home_screen.dart';
import 'package:http/http.dart' as http;

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

  Future<VisionResponseModel> fetchDataVisionAI(Uint8List dataImage,String accessToken,{ActionDetect type = ActionDetect.IMAGE_LOCAL,String imageUrl = ""}) async {
    final dataBase = base64Encode(dataImage);
    final param = type == ActionDetect.IMAGE_LOCAL ? {
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
    } : {
      "requests": [
        {
          "image": {
            "source": {
              "imageUri": imageUrl
            }
          },
          "features": [
            {
              "type": "DOCUMENT_TEXT_DETECTION"
            }
          ],
          "imageContext": {
            "languageHints": ["en-t-i0-handwrit"]
          }
        }
      ]
    };
    final response = await _client.postRequest(
      AppEndPoints.fetchDataVisionAI.path,
      idToken: accessToken,
      data: param
    );
    print('DATATATATATATAT = ${response.data}');
    return VisionResponseModel.fromJson(response.data);
  }
}
