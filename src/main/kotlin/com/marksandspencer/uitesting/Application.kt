package com.marksandspencer.uitesting

import androidx.compose.ui.test.ComposeUiTest
import com.marksandspencer.uitesting.assertions.shows

inline fun <reified Content : Screen> ComposeUiTest.launch(): State<Content> {
    @Suppress("DEPRECATION")
    val content = Content::class.java.newInstance()
    return State(compose = this, content = content).shows()
}
