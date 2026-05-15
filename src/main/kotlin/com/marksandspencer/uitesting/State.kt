package com.marksandspencer.uitesting

import androidx.compose.ui.test.ComposeUiTest

class State<Content : Screen> @PublishedApi internal constructor(
    internal val compose: ComposeUiTest,
    internal val content: Content,
)
