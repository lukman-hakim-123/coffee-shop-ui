import 'dart:typed_data';

import 'package:appwrite/models.dart';
import 'package:coffee_shop/core/appwrite.dart';
import '../models/menu.dart';
import 'package:appwrite/appwrite.dart';

class MenuSource {
  static Client client = Client()
      .setEndpoint(AppwriteConstants.endpoint)
      .setProject(AppwriteConstants.projectId);
  static Databases databases = Databases(client);
  static Storage storages = Storage(client);

  static Future<List<Menu>> getMenus() async {
    try {
      final response = await databases.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.collectionId,
      );

      return response.documents.map((Document doc) {
        return Menu.fromMap(doc.data);
      }).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<Uint8List?> getImage(String imageId) async {
    try {
      final response = await storages.getFileView(
        bucketId: AppwriteConstants.bucketId,
        fileId: imageId,
      );
      return response;
    } catch (e) {
      print('Error fetching image: $e');
      return null;
    }
  }
}
