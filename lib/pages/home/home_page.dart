
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/pages/home/states/home_states.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {
    final getWeathersPrv = ref.watch(getWeatherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anasayfa'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
      ),
      body: getWeathersPrv.when(
        data: (data) {
          if (data != null) {
            return RefreshIndicator(
              onRefresh: () => ref.refresh(getWeatherProvider.future),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: Center(
                          child: Text(
                              "Minimum : ${data.temperature["Minimum"]["Value"]}F\nMaximum : ${data.temperature["Maximum"]["Value"]}F")),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('Veri Yok'));
          }
        },
        error: (error, stackTrace) => Center(
          child: Text('Bir hata meydana geldi : ${error.toString()}'),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
