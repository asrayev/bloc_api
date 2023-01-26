import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/multi_state_bloc.dart';


class MultiStateBlocPage extends StatelessWidget {
  const MultiStateBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<MultiStateBloc, MultiStateState>(
          listener: (context, state){},
          builder: (context, state){
            if(state is GettingDataInProgress){
              return const CircularProgressIndicator();
            }
            if (state is GettingDataInFailure){
              return const Text("Failure");
            }

            if (state is GettingDataInSuccess){
              return ListView.builder(
                  itemCount: state.cards.length,
                  itemBuilder: (context, index){
                return Text("${state.cards[index].bankName}");
              });
            }
            else {
              return Container();
            }

          },

        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          context.read<MultiStateBloc>().add(GetDataFromApiEvent());
        }, ),

    );
  }
}
