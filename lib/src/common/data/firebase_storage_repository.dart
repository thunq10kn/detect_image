import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_storage_repository.g.dart';

@Riverpod(keepAlive: true)
FirebaseStorageRepository firebaseStorageRepository(
  FirebaseStorageRepositoryRef ref,
) {
  final firebaseStorage = FirebaseStorage.instance;
  return FirebaseStorageRepository(firebaseStorage);
}

class FirebaseStorageRepository {
  FirebaseStorageRepository(this._firebaseStorage);
  final FirebaseStorage _firebaseStorage;

  /// Get Download URL from imagePath.
  ///
  /// The retrieved URL should be displayed using [CachedNetworkImage].
  Future<String> getDownloadURL(String imagePath) async {
    if (imagePath == '') {
      return '';
    }
    return _firebaseStorage.ref(imagePath).getDownloadURL();
  }
}
