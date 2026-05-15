package com.marksandspencer.uitesting.actions

import androidx.compose.ui.test.doubleClick
import androidx.compose.ui.test.performClick
import androidx.compose.ui.test.performTouchInput
import com.marksandspencer.uitesting.Element
import com.marksandspencer.uitesting.Screen
import com.marksandspencer.uitesting.State
import com.marksandspencer.uitesting.elements.Nowhere
import com.marksandspencer.uitesting.perform
import com.marksandspencer.uitesting.performNavigate

fun <Content : Screen> State<Content>.tap(
    select: Content.() -> Element<Nowhere>,
): State<Content> = perform(select) { performClick() }

fun <Content : Screen, Destination : Screen> State<Content>.navigate(
    select: Content.() -> Element<Destination>,
): State<Destination> = performNavigate(select) { performClick() }

fun <Content : Screen> State<Content>.doubleTap(
    select: Content.() -> Element<Nowhere>,
): State<Content> = perform(select) { performTouchInput { doubleClick() } }

fun <Content : Screen, Destination : Screen> State<Content>.doubleTapNavigate(
    select: Content.() -> Element<Destination>,
): State<Destination> = performNavigate(select) { performTouchInput { doubleClick() } }
