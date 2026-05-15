package com.marksandspencer.uitesting.app

import androidx.compose.foundation.layout.Box
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue

@Composable
fun ExampleApp() {
    var loggedInUser by remember { mutableStateOf<String?>(null) }

    Box {
        if (loggedInUser == null) {
            MainScreen(onLogin = { loggedInUser = it })
        } else {
            DetailScreen(username = loggedInUser!!)
        }
    }
}
