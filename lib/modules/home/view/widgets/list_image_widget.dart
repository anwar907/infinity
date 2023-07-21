import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity/modules/home/bloc/home_bloc.dart';

class ListImageWidget extends StatelessWidget {
  const ListImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeEventImage()),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state.status == InitialState.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == InitialState.success) {
          return SingleChildScrollView(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                children: state.imageUrl!
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.memory(e, fit: BoxFit.cover),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        }

        if (state.status == InitialState.failure) {
          return const Center(
            child: Text('Something wrong'),
          );
        }

        return const SizedBox();
      }),
    );
  }
}
