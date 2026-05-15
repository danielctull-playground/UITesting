package com.marksandspencer.uitesting.elements

import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.hasTestTag
import androidx.compose.ui.test.performTextInput
import com.marksandspencer.uitesting.Element
import com.marksandspencer.uitesting.Screen
import com.marksandspencer.uitesting.State
import com.marksandspencer.uitesting.assertions.element

sealed interface TextInput : Element

class TextField(override val matcher: SemanticsMatcher) : TextInput {

    constructor(tag: String) : this(hasTestTag(tag))
}

fun <Content : Screen> State<Content>.type(
    text: String,
    into: Content.() -> TextInput,
): State<Content> {
    val textField = element(into)
    textField.id(compose).performTextInput(text)
    return this
}
