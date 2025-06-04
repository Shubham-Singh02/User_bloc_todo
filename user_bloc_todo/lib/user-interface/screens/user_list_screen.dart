import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_bloc_todo/utils/colors.dart';
import '../../logic/bloc/users_bloc.dart';
import '../../logic/bloc/users_event.dart';
import '../../logic/bloc/users_state.dart';
import '../widgets/user_card.dart';
import '../../data/repositories/user_repository.dart';
import 'user_detail_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late UsersBloc _usersBloc;

  @override
  void initState() {
    super.initState();
    _usersBloc = UsersBloc(UserRepository())..add(FetchUsers(isInitialFetch: true));
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      _usersBloc.add(FetchUsers());
    }
  }

  void _onSearchChanged(String text) {
    _usersBloc.add(FetchUsers(isInitialFetch: true, search: text));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _usersBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _usersBloc,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(scrolledUnderElevation: 0, backgroundColor: Colors.transparent, title: Text('Users', style: TextStyle(color:cardcolor2.shade300,fontWeight: FontWeight.bold),),titleSpacing: 30, actions: [ 
    IconButton(
      icon: Icon(Icons.more_vert_rounded),
      onPressed: () {},
    ),]),
        body: Stack(
          children: [
            Container(
            decoration:BoxDecoration(
              gradient: background,
            ),
            ),
            SafeArea(
              child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusColor: Colors.pink.shade300,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<UsersBloc, UsersState>(
                    builder: (context, state) {
                      if (state is UsersLoading && _searchController.text.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is UsersLoaded) {
                        if (state.users.isEmpty) {
                          return const Center(child: Text('No users found.', style: TextStyle(color: Colors.grey),));
                        }
                        return ListView.builder(
                          controller: _scrollController,
                          itemCount: state.hasReachedMax
                              ? state.users.length
                              : state.users.length + 1,
                          itemBuilder: (context, index) {
                            if (index >= state.users.length) {
                              return const Center(child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircularProgressIndicator(),
                              ));
                            }
                            final user = state.users[index];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: InkWell(
                                 onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => UserDetailScreen(user: user),
                                      ),
                                    );
                                  },
                                child: UserCard(
                                  user: user,
                                  gradient: index.isEven?cardgrad2:cardgrad1,
                                  textcolor: index.isEven?Colors.white:Colors.grey,
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state is UsersError) {
                        return Center(child: Text(state.message));
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
                        ),
            ),
          ]
        ),
      ),
    );
  }
}
