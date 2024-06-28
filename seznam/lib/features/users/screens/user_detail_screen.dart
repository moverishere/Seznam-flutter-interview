import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seznam/core/widgets/custom_appbar.dart';
import 'package:seznam/features/users/providers/user_provider.dart';
import 'package:seznam/features/users/widgets/images_tab.dart';
import 'package:seznam/features/users/widgets/posts_tab.dart';
import 'package:seznam/features/users/widgets/user_detail_item.dart';

class UserDetailScreen extends ConsumerWidget {
  const UserDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider(id));
    final textTheme = Theme.of(context).textTheme;
    final themeColors = Theme.of(context).colorScheme;

    return CustomScaffold(
      title: 'User Detail',
      showBackButton: true,
      body: userAsyncValue.when(
        data: (user) => DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: 'Posts'),
                        Tab(text: 'Images'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          PostsTab(userId: id, textTheme: textTheme, themeColors: themeColors),
                          ImagesTab(userId: id),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Divider(thickness: 2, color: themeColors.secondary),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailItem(icon: Icons.person, label: 'Name:', value: user.name, textTheme: textTheme),
                      DetailItem(icon: Icons.person_outline, label: 'Username:', value: user.username, textTheme: textTheme),
                      DetailItem(icon: Icons.email, label: 'Email:', value: user.email, textTheme: textTheme),
                      DetailItem(icon: Icons.phone, label: 'Phone:', value: user.phone, textTheme: textTheme),
                      DetailItem(icon: Icons.web, label: 'Website:', value: user.website, textTheme: textTheme),
                      const SizedBox(height: 20),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(Icons.home, size: 20),
                          const SizedBox(width: 5),
                          Text('Address:', style: textTheme.titleLarge),
                        ],
                      ),
                      DetailItem(icon: Icons.location_city, label: 'Street:', value: user.address.street, textTheme: textTheme),
                      DetailItem(icon: Icons.location_on, label: 'Suite:', value: user.address.suite, textTheme: textTheme),
                      DetailItem(icon: Icons.location_city, label: 'City:', value: user.address.city, textTheme: textTheme),
                      DetailItem(icon: Icons.local_post_office, label: 'Zipcode:', value: user.address.zipcode, textTheme: textTheme),
                      const SizedBox(height: 20),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(Icons.map, size: 20),
                          const SizedBox(width: 5),
                          Text('Geo:', style: textTheme.titleLarge),
                        ],
                      ),
                      DetailItem(icon: Icons.my_location, label: 'Lat:', value: user.address.geo.lat, textTheme: textTheme),
                      DetailItem(icon: Icons.my_location, label: 'Lng:', value: user.address.geo.lng, textTheme: textTheme),
                      const SizedBox(height: 20),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(Icons.business, size: 20),
                          const SizedBox(width: 5),
                          Text('Company:', style: textTheme.titleLarge),
                        ],
                      ),
                      DetailItem(icon: Icons.apartment, label: 'Name:', value: user.company.name, textTheme: textTheme),
                      DetailItem(icon: Icons.format_quote, label: 'Catch Phrase:', value: user.company.catchPhrase, textTheme: textTheme),
                      DetailItem(icon: Icons.business_center, label: 'BS:', value: user.company.bs, textTheme: textTheme),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
