import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:seznam/features/users/providers/user_provider.dart';

class ImagesTab extends ConsumerWidget {
  const ImagesTab({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPhotosAsyncValue = ref.watch(userPhotosProvider(userId));

    return userPhotosAsyncValue.when(
      data: (photos) => RefreshIndicator(
        onRefresh: () => ref.refresh(userPhotosProvider(userId).future),
        child: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context, index) {
            final photo = photos[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(photo.title, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 10),
                  CachedNetworkImage(
                    imageUrl: photo.url,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
