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
        if(data.isNotEmpty) {
          return RefreshIndicator(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return const Row();
              },
            ),
            onRefresh: () => ref.refresh(getWeathersProvider.future),
          );
        }else{
          return const Center(child: Text('Veri bulunamadı :('),);
        }
      },
      error: (error, stackTrace) => Center(
        child: Text('Bir hata meydana geldi : ${error.toString()}'),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
