package com.marksandspencer.uitesting.elements

import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.hasTestTag

class SecureTextField(override val matcher: SemanticsMatcher) : TextInput {

    constructor(tag: String) : this(hasTestTag(tag))
}
