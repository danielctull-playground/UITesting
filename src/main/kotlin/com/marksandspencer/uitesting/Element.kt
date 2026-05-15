package com.marksandspencer.uitesting

import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.SemanticsNodeInteraction

interface Element {
    val matcher: SemanticsMatcher
    val id: Query<SemanticsNodeInteraction>
        get() = Query { it.onNode(matcher) }
}
