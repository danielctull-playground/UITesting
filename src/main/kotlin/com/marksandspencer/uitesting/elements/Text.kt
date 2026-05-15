package com.marksandspencer.uitesting.elements

import androidx.compose.ui.semantics.SemanticsProperties
import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.hasTestTag
import com.marksandspencer.uitesting.Element
import com.marksandspencer.uitesting.Query

class Text(override val matcher: SemanticsMatcher) : Element<Nowhere> {

    constructor(tag: String) : this(hasTestTag(tag))

    val value: Query<String?>
        get() = id.map { interaction ->
            interaction.fetchSemanticsNode()
                .config
                .getOrElseNullable(SemanticsProperties.Text) { null }
                ?.firstOrNull()
                ?.text
        }
}
