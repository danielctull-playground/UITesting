package com.marksandspencer.uitesting.actions

import androidx.compose.ui.test.longClick
import androidx.compose.ui.test.performTouchInput
import com.marksandspencer.uitesting.Element
import com.marksandspencer.uitesting.Screen
import com.marksandspencer.uitesting.State
import com.marksandspencer.uitesting.elements.Nowhere
import com.marksandspencer.uitesting.perform

fun <Content : Screen> State<Content>.press(
    select: Content.() -> Element<Nowhere>,
    durationMs: Long,
): State<Content> = perform(select) { performTouchInput { longClick(durationMillis = durationMs) } }
