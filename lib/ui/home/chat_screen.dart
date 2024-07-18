import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme_data.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                _buildMessage(
                  context,
                  'Hello, how can I help you today?',
                  isUserMessage: false,
                ),
                _buildMessage(
                  context,
                  'I have a question about my lab results.',
                  isUserMessage: true,
                ),
                _buildMessage(
                  context,
                  'Sure, let me check that for you.',
                  isUserMessage: false,
                ),
                // Add more messages here
              ],
            ),
          ),
          _buildMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildMessage(BuildContext context, String message, {required bool isUserMessage}) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        margin: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUserMessage ? Colors.white : Colors.black,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          IconButton(
            icon: const Icon(Icons.send, color: appBarColor),
            onPressed: () {
              // Handle send message action
            },
          ),
        ],
      ),
    );
  }
}
