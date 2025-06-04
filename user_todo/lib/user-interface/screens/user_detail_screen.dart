import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_todo/utils/colors.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';
import '../../logic/bloc/user_detail_bloc.dart';
import '../../logic/bloc/user_detail_event.dart';
import '../../logic/bloc/user_detail_state.dart';
import '../widgets/post_card.dart';
import '../widgets/todo_tile.dart';
import 'create_post_screen.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserDetailBloc(UserRepository())..add(FetchUserDetail(userId: user.id)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(scrolledUnderElevation: 0,
          title: Text(user.fullName),backgroundColor: Colors.transparent,),
        body: Stack(
          children:[ 
             Container(
            decoration:BoxDecoration(
              gradient: background,
            ),
            ),
            SafeArea(
            child: BlocBuilder<UserDetailBloc, UserDetailState>(
              builder: (context, state) {
                if (state is UserDetailLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserDetailLoaded) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(radius: 30, backgroundImage: NetworkImage(user.image)),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.fullName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(user.email),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text("Posts", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        ...state.posts.map((post) => PostCard(post: post)).toList(),
                        const SizedBox(height: 20),
                        const Text("Todos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        ...state.todos.map((todo) => TodoTile(todo: todo)).toList(),
                      ],
                    ),
                  );
                } else if (state is UserDetailError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CreatePostScreen(),
              ),
            );

            if (result != null && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Post created locally!')),
              );
            }
          },
          backgroundColor: const Color.fromARGB(255, 255, 241, 183),
          child: const Icon(Icons.add,color: Colors.black54,),
        ),
      ),
    );
  }
}
