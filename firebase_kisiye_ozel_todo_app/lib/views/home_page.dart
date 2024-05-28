import 'package:firebase_kisiye_ozel_todo_app/components/my_list_tile.dart';
import 'package:firebase_kisiye_ozel_todo_app/constant/my_colors.dart';
import 'package:firebase_kisiye_ozel_todo_app/constant/my_texts.dart';
import 'package:firebase_kisiye_ozel_todo_app/models/todo.dart';
import 'package:firebase_kisiye_ozel_todo_app/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.backgroundColor,
      appBar: _buildAppbar(context),
      body: _buildBody(context),
      floatingActionButton: _buildFabButton(context),
      drawer: _buildDrawer(context),
    );
  }

  _buildBody(BuildContext context) {
    HomePageViewModel viewModel = Provider.of(context, listen: false);
    return StreamBuilder(
      stream: viewModel.getList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Todo>? todos = snapshot.data;
          return ListView.builder(
            itemCount: todos!.length,
            itemBuilder: (context, index) {
              var todo = todos[index];
              return MyListTile(
                text: todo.todo,
                isCompleted: todo.isCompleted,
                onChanged: (p0) {
                  viewModel.changeCheckBox(todo, p0!);
                },
                onSelected: (p0) {
                  if (p0 == "delete") {
                    viewModel.deleteToTodo(todo);
                  } else if (p0 == "edit") {
                    viewModel.updateToTodo(context, todo);
                  }
                },
              );
            },
          );
        }
      },
    );
  }

  _buildAppbar(BuildContext context) {
    HomePageViewModel viewModel = Provider.of<HomePageViewModel>(context, listen: false);
    return AppBar(
      iconTheme: IconThemeData(color: MyColors.instance.listTileColor),
      elevation: 0,
      backgroundColor: MyColors.instance.transparentColor,
      title: FutureBuilder(
        future: viewModel.getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userList = snapshot.data!;
            return Text(
              "${MyTexts.instance.helloText} ${userList[0].name}",
              style: TextStyle(
                color: MyColors.instance.listTileColor,
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  _buildFabButton(BuildContext context) {
    HomePageViewModel viewModel = Provider.of<HomePageViewModel>(context, listen: false);
    return FloatingActionButton(
      elevation: 10,
      shape: const CircleBorder(),
      backgroundColor: MyColors.instance.fabButtonBackgroundColor,
      onPressed: () {
        viewModel.addToTodo(context);
      },
      child: Icon(
        Icons.add,
        color: MyColors.instance.black,
        size: 36,
      ),
    );
  }

  _buildDrawer(BuildContext context) {
    HomePageViewModel viewModel = Provider.of<HomePageViewModel>(context, listen: false);
    return Drawer(
      width: 70,
      backgroundColor: MyColors.instance.listTileColor,
      child: IconButton(
        icon: Icon(
          Icons.logout,
          color: MyColors.instance.black,
        ),
        onPressed: () {
          viewModel.logOut();
        },
      ),
    );
  }
}
