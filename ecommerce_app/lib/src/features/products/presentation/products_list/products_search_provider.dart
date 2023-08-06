import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productSearchQueryProvider = StateProvider<String>((ref) => '');

final productSearchResultProvider =
    FutureProvider.autoDispose<List<Product>>((ref) async {
  final searchQuery = ref.watch(productSearchQueryProvider);
  return ref.watch(productSearchProvider(searchQuery).future);
});
