import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;
  Future<void> addPortfolioItem(String title, String description, String imageUrl) async {
    final response = await _client.from('portfolio_data').insert({
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'created_at': DateTime.now().toIso8601String(),
    });

    if (response.error != null) {
      throw Exception('خطأ: ${response.error!.message}');
    }
  }
  // Fetch data from a specific table
  Future<List<Map<String, dynamic>>> fetchData(String table) async {
    final response = await _client.from(table).select();
    return response;
  }

  // Insert data into a table
  Future<void> insertData(String table, Map<String, dynamic> data) async {
    await _client.from(table).insert(data);
  }

  // Update data in a table
  Future<void> updateData(String table, Map<String, dynamic> data, String column, dynamic value) async {
    await _client.from(table).update(data).eq(column, value);
  }

  // Delete data from a table
  Future<void> deleteData(String table, String column, dynamic value) async {
    await _client.from(table).delete().eq(column, value);
  }

  // Upload image to Supabase Storage
  Future<String?> uploadImage(String bucket, String path, dynamic file) async {
    final response = await _client.storage.from(bucket).upload(path, file);
    return response;
  }

  // Get public URL for an uploaded image
  String getImageUrl(String bucket, String path) {
    return _client.storage.from(bucket).getPublicUrl(path);
  }
}