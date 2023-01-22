import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_call/profile/ProfileModel.dart';
import 'package:flutter_bloc_api_call/testblock/bloc/testbloc_bloc.dart';

class NewTestHomePage extends StatefulWidget {
  const NewTestHomePage({super.key});

  @override
  State<NewTestHomePage> createState() => _NewTestHomePageState();
}

class _NewTestHomePageState extends State<NewTestHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Start')),
      body: BlocBuilder<TestblocBloc, TestblocState>(builder: (context, state) {
        if (state is TestblocInitial) {
          return const Center(child: Text("Initial State "));
        }
        if (state is TestblocLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TestblocSuccess) {
          List<ProfileModel> data = state.list;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'B-->: ${data[index].body}',
                  style: const TextStyle(fontSize: 24),
                ),
                subtitle: Text(
                  'email: ${data[index].email}',
                  style: const TextStyle(fontSize: 16),
                ),
                leading: Text(
                  '${index + 1}',
                  style: const TextStyle(fontSize: 24),
                ),
              );
            },
          );
        }
        if (state is TestblocFailed) {
          return Text(state.msg);
        }
        return Text('some error');
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TestblocBloc>().add(FetchServiceCLickListner());
        },
        tooltip: 'Call API',
        child: const Icon(Icons.add),
      ),
    );
  }
}
