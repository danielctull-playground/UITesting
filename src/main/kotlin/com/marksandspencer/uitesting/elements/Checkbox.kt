package com.marksandspencer.uitesting.elements

import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.hasTestTag
import com.marksandspencer.uitesting.Element

class Checkbox(override val matcher: SemanticsMatcher) : Element<Nowhere> {

    constructor(tag: String) : this(hasTestTag(tag))
}
