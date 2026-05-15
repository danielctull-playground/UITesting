package com.marksandspencer.uitesting.assertions

import com.marksandspencer.uitesting.Screen
import com.marksandspencer.uitesting.State

@PublishedApi
internal fun <Content : Screen> State<Content>.shows(): State<Content> {
    try {
        element { id }
    } catch (_: ElementDoesNotExist) {
        throw ScreenDoesNotShow(content)
    }
    return this
}

class ScreenDoesNotShow internal constructor(
    val screen: Screen,
) : AssertionError("Screen does not show. screen=$screen")
