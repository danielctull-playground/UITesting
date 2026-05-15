package com.marksandspencer.uitesting.app

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.testTag
import androidx.compose.ui.unit.dp

@Composable
fun DetailScreen(username: String) {
    Column(modifier = Modifier.padding(16.dp)) {
        Text(
            text = "hello, $username",
            modifier = Modifier.testTag("detail-title"),
        )
    }
}
