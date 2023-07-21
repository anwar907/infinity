import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity/modules/home/bloc/home_bloc.dart';

class ListContentWidget extends StatelessWidget {
  const ListContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(HomeEventContent()),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state.status == InitialState.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == InitialState.success) {
          return ListView.builder(
              itemCount: state.textDataModels?.data?.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Text(
                    state.textDataModels?.data?[index] ?? '',
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              });
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
