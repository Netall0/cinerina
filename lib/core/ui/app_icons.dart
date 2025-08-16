import 'package:cinerina/core/assets/atlas_map.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static final AppIcons _instance = AppIcons._();
  static AppIcons get instance => _instance;
  AppIcons._();

  Widget home({double size = 24, Color? color}) => 
    SpriteIcon('home', size: size, color: color);
  
  Widget user({double size = 24, Color? color}) => 
    SpriteIcon('user', size: size, color: color);
    
  Widget search({double size = 24, Color? color}) => 
    SpriteIcon('search', size: size, color: color);
    
  Widget menu({double size = 24, Color? color}) => 
    SpriteIcon('menu', size: size, color: color);
}