package com.marksandspencer.uitesting.elements

import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.hasTestTag
import com.marksandspencer.uitesting.Element

sealed interface TextInput : Element<Nowhere>

class TextField(override val matcher: SemanticsMatcher) : TextInput {

    constructor(tag: String) : this(hasTestTag(tag))
}
