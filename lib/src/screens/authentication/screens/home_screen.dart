import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';
import 'package:radio_group_v2/widgets/views/radio_group.dart';
import 'package:rem_admin/src/common/presentation/app_func.dart';
import 'package:rem_admin/src/common/presentation/app_images.dart';
import 'package:rem_admin/src/common/utils/image_helper/imagehelper.dart';
import 'package:rem_admin/src/screens/authentication/controllers/home_controller.dart';
import 'package:rem_admin/src/screens/authentication/model/vision_response_model.dart';

/// Phone number input screen
enum ActionDetect { IMAGE_URL, IMAGE_LOCAL }

class LoginScreen extends HookConsumerWidget {
  LoginScreen({super.key});

  RadioGroupController myController = RadioGroupController();
  RadioGroupController rdoDetectImageType = RadioGroupController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickImage = useState<Uint8List?>(null);
    final dataVision = useState<String>("");
    final indexPickDetectImageType = useState<int>(0);
    final indexSelected = useState<int>(0);
    final textController =
        useState<TextEditingController>(TextEditingController());
    final urlImageController =
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Gap(20),
              // RadioGroup(
              //   controller: rdoDetectImageType,
              //   values: const ["Google Vision AI", "PaddleOCR","Tesseract OCR"],
              //   indexOfDefault: 0,
              //   orientation: RadioGroupOrientation.horizontal,
              //   decoration: const RadioGroupDecoration(
              //     spacing: 10.0,
              //     labelStyle: TextStyle(
              //       color: Colors.white,
              //     ),
              //     activeColor: Colors.white,
              //   ),
              //   onChanged: (index) {
              //     indexPickDetectImageType.value = rdoDetectImageType.selectedIndex;
              //   },
              // ),
              const Gap(20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: indexPickDetectImageType.value == 0,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        child: const Text("Access Token")),
                  ),
                  Visibility(
                    visible: indexPickDetectImageType.value == 0,
                    child: const Gap(10),
                  ),
                  Visibility(
                    visible: indexPickDetectImageType.value == 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 50),
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
                  ),
                  const Gap(20),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RadioGroup(
                            controller: myController,
                            values: const ["Image Local", "Image Url"],
                            indexOfDefault: 0,
                            orientation: RadioGroupOrientation.horizontal,
                            decoration: const RadioGroupDecoration(
                              spacing: 10.0,
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              activeColor: Colors.white,
                            ),
                            onChanged: (index) {
                              indexSelected.value =
                                  myController.selectedIndex;
                            },
                          ),
                          const Gap(20),
                          Visibility(
                            visible: indexSelected.value == 0,
                            child: Container(
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
                                        ImageHelper.loadFromAsset(
                                            AppAssets.imgImageCover,
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
                                                    color: Colors.black,
                                                    fontSize: 20)),
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
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible: indexSelected.value == 1,
                            child: Container(
                              width: 500,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 50),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: TextFormField(
                                controller: urlImageController.value,
                                decoration: const InputDecoration(
                                  hintText: "Input Url Image",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const Gap(20),
                          InkWell(
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              child: const Center(
                                child: Text(
                                  "Detect Image",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            onTap: () {
                              if ((myController.selectedIndex == 0 &&
                                      pickImage.value != null) ||
                                  (myController.selectedIndex == 1 &&
                                      urlImageController.value.text
                                          .trim()
                                          .isNotEmpty)) {
                                ActionDetect type =
                                    myController.selectedIndex == 0
                                        ? ActionDetect.IMAGE_LOCAL
                                        : ActionDetect.IMAGE_URL;
                                ref
                                    .read(homeControllerProvider.notifier)
                                    .fetchDataVisionAI(pickImage.value ?? Uint8List(0),
                                        textController.value.text,
                                        urlImage: urlImageController.value.text
                                            .trim(),
                                        type: type, callBack:
                                            (VisionResponseModel response) {
                                  if (response.responses?.isNotEmpty == true) {
                                    dataVision.value = response.responses![0]
                                        .textAnnotations![0].description
                                        .toString();
                                  }
                                });
                              }
                            },
                          )
                        ],
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}
