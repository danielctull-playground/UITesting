package com.marksandspencer.uitesting.elements

import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.hasTestTag
import androidx.compose.ui.test.performClick
import com.marksandspencer.uitesting.Element
import com.marksandspencer.uitesting.Screen
import com.marksandspencer.uitesting.State
import com.marksandspencer.uitesting.assertions.element

class Checkbox(override val matcher: SemanticsMatcher) : Element {

    constructor(tag: String) : this(hasTestTag(tag))
}

fun <Content : Screen> State<Content>.toggle(
    select: Content.() -> Checkbox,
): State<Content> {
    val checkbox = element(select)
    checkbox.id(compose).performClick()
    return this
}
