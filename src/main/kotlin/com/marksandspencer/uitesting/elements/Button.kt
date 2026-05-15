package com.marksandspencer.uitesting.elements

import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.hasTestTag
import androidx.compose.ui.test.performClick
import com.marksandspencer.uitesting.Element
import com.marksandspencer.uitesting.Screen
import com.marksandspencer.uitesting.State
import com.marksandspencer.uitesting.assertions.element

class Button(override val matcher: SemanticsMatcher) : Element {

    constructor(tag: String) : this(hasTestTag(tag))
}

fun <Content : Screen> State<Content>.tap(
    select: Content.() -> Element,
): State<Content> {
    val button = element(select)
    button.id(compose).performClick()
    return this
}
