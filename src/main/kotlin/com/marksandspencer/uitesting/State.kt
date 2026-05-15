package com.marksandspencer.uitesting

import androidx.compose.ui.test.ComposeUiTest
import androidx.compose.ui.test.SemanticsNodeInteraction
import com.marksandspencer.uitesting.assertions.element
import com.marksandspencer.uitesting.assertions.shows
import com.marksandspencer.uitesting.elements.Nowhere

class State<Content : Screen> @PublishedApi internal constructor(
    internal val compose: ComposeUiTest,
    internal val content: Content,
)

internal fun <Content : Screen> State<Content>.perform(
    select: Content.() -> Element<Nowhere>,
    action: SemanticsNodeInteraction.() -> Unit,
): State<Content> {
    val el = element(select)
    el.id(compose).action()
    return this
}

internal fun <Content : Screen, D : Screen> State<Content>.performNavigate(
    select: Content.() -> Element<D>,
    action: SemanticsNodeInteraction.() -> Unit,
): State<D> {
    val el = element(select)
    el.id(compose).action()
    @Suppress("UNCHECKED_CAST")
    val destination = (el as? HasDestination<D>)?.destination?.invoke()
        ?: error("Element does not have a destination")
    return State(compose = compose, content = destination).shows()
}

internal interface HasDestination<D : Screen> {
    val destination: () -> D
}
