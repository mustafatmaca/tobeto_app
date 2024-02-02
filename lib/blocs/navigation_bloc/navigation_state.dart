import 'package:flutter/material.dart';
import 'package:tobeto_app/screens/calendar_screen.dart';
import 'package:tobeto_app/screens/catalog_screen.dart';
import 'package:tobeto_app/screens/home_screen.dart';
import 'package:tobeto_app/screens/more_screen.dart';
import 'package:tobeto_app/screens/reviews_screen.dart';

abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationLoaded extends NavigationState {
  List<Widget> pages = [
    const HomeScreen(),
    const ReviewsScreen(),
    const CatalogScreen(),
    const CalendarPage(),
    const MoreScreen(),
  ];

  int currentPage = 0;

  NavigationLoaded({required this.currentPage});
}

class NavigationError extends NavigationState {}
