package com.marksandspencer.uitesting.elements

import androidx.compose.ui.test.SemanticsMatcher
import androidx.compose.ui.test.hasTestTag
import com.marksandspencer.uitesting.Element
import com.marksandspencer.uitesting.HasDestination
import com.marksandspencer.uitesting.Screen

class Button<D : Screen>(
    override val matcher: SemanticsMatcher,
    override val destination: () -> D,
) : Element<D>, HasDestination<D>

fun Button(tag: String): Button<Nowhere> =
    Button(hasTestTag(tag)) { Nowhere }

fun <D : Screen> Button(tag: String, destination: () -> D): Button<D> =
    Button(hasTestTag(tag), destination)
