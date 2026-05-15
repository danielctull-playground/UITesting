package com.marksandspencer.uitesting.assertions

import com.marksandspencer.uitesting.Element
import com.marksandspencer.uitesting.Screen
import com.marksandspencer.uitesting.State

internal fun <Content : Screen, E : Element<*>> State<Content>.element(
    select: Content.() -> E,
): E {
    val element = content.select()
    try {
        compose.waitUntil(timeoutMillis = 10_000) {
            compose.onAllNodes(element.matcher)
                .fetchSemanticsNodes()
                .isNotEmpty()
        }
    } catch (cause: Exception) {
        throw ElementDoesNotExist(content, element, cause)
    }
    return element
}

fun <Content : Screen> State<Content>.expect(
    exists: Content.() -> Element<*>,
): State<Content> {
    element(exists)
    return this
}

internal class ElementDoesNotExist(
    val screen: Screen,
    val element: Element<*>,
    cause: Throwable? = null,
) : AssertionError("Element does not exist. screen=$screen element=$element", cause)
