package com.marksandspencer.uitesting.elements

import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.hasTestTag
import androidx.compose.ui.test.performClick
import com.marksandspencer.uitesting.Element
import com.marksandspencer.uitesting.Screen
import com.marksandspencer.uitesting.State
import com.marksandspencer.uitesting.assertions.element
import com.marksandspencer.uitesting.assertions.shows

class Navigation<Destination : Screen>(
    override val matcher: SemanticsMatcher,
    val destination: () -> Destination,
) : Element {

    constructor(tag: String, destination: () -> Destination) : this(hasTestTag(tag), destination)
}

fun <Content : Screen, Destination : Screen> State<Content>.navigate(
    select: Content.() -> Navigation<Destination>,
): State<Destination> {
    val navigation = element(select)
    navigation.id(compose).performClick()
    return State(compose = compose, content = navigation.destination()).shows()
}
