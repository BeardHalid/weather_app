import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/pages/home/states/home_states.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getWeathersPrv = ref.watch(getWeathersProvider);
    return getWeathersPrv.when(
      data: (data) {
        return RefreshIndicator(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
                final item = data[index];
                return Row();
            },
          ),
          onRefresh: () => ref.refresh(getWeathersProvider.future),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text('Bir hata meydana geldi : ${error.toString()}'),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
