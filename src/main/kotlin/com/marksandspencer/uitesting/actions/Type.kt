package com.marksandspencer.uitesting.actions

import androidx.compose.ui.test.performTextInput
import com.marksandspencer.uitesting.Screen
import com.marksandspencer.uitesting.State
import com.marksandspencer.uitesting.assertions.element
import com.marksandspencer.uitesting.elements.TextInput

fun <Content : Screen> State<Content>.type(
    text: String,
    into: Content.() -> TextInput,
): State<Content> {
    val textField = element(into)
    textField.id(compose).performTextInput(text)
    return this
}
