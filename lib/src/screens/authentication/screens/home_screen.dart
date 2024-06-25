import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';
import 'package:rem_admin/src/common/presentation/app_func.dart';
import 'package:rem_admin/src/common/presentation/app_images.dart';
import 'package:rem_admin/src/common/utils/image_helper/imagehelper.dart';
import 'package:rem_admin/src/screens/authentication/controllers/home_controller.dart';
import 'package:rem_admin/src/screens/authentication/model/vision_response_model.dart';

/// Phone number input screen
class LoginScreen extends HookConsumerWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickImage = useState<Uint8List?>(null);
    final dataVision = useState<String>("");
    final textController =
        useState<TextEditingController>(TextEditingController());
    return SelectionArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgBackgroundSignin),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
                child: TextFormField(
                  controller: textController.value,
                  decoration: const InputDecoration(
                    hintText: "Input Access Token",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 500,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            if (pickImage.value == null)
                              ImageHelper.loadFromAsset(AppAssets.imgImageCover,
                                  fit: BoxFit.cover),
                            if (pickImage.value != null)
                              Image.memory(
                                pickImage.value!,
                                width: 500,
                                height: 700,
                              ),
                            const Positioned(
                              bottom: 20,
                              child: SizedBox(
                                width: 500,
                                child: Center(
                                  child: Text("Pick Image",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () async {
                        await AppFunc().getImage(callBack: (image) {
                          if (image is PlatformFile) {
                            pickImage.value = image.bytes;
                            ref
                                .read(homeControllerProvider.notifier)
                                .fetchDataVisionAI(
                                    pickImage.value, textController.value.text,
                                    callBack: (VisionResponseModel response) {
                              if (response.responses?.isNotEmpty == true) {
                                dataVision.value = response.responses![0]
                                    .textAnnotations![0].description
                                    .toString();
                              }
                            });
                          }
                        });
                      },
                    ),
                  ),
                  const Gap(60),
                  Container(
                    width: 700,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                      child: Text(
                        dataVision.value,
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
