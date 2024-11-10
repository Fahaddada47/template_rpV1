import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/main.dart';
import 'package:riverpod_template/src/features/user/presentation/provider/user_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUsers = ref.watch(asyncUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TalkerScreen(talker: talker),
            ),
          );
        },
        child: const Icon(Icons.bug_report),
      ),
      body: asyncUsers.when(
        data: (users) => RefreshIndicator(
          onRefresh: ()=> ref.read(asyncUserProvider.notifier).refresh(),
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.phone),
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}


// import 'package:basic_structure/src/features/user/provider/user_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:talker_flutter/talker_flutter.dart';
//
// import '../../../../main.dart';
//
// class UserScreen extends ConsumerWidget {
//   const UserScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final asyncUsers = ref.watch(asyncUserProvider);
//
//     return switch (asyncUsers) {
//       AsyncData(:final value) => Scaffold(
//         appBar: AppBar(
//           title: const Text('User Data'),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   final user = value[index];
//                   return ListTile(
//                     title: Text(user.name),
//                     subtitle: Text(user.phone),
//                   );
//                 },
//                 itemCount: value.length,
//               ),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => TalkerScreen(talker: talker),
//               ),
//             );
//           },
//           child: const Icon(Icons.bug_report),
//         ),
//       ),
//       AsyncError(:final error) => Scaffold(
//         body: Center(
//           child: Text('Error: $error'),
//         ),
//       ),
//       _ => const Center(child: CircularProgressIndicator()),
//     };
//   }
// }
