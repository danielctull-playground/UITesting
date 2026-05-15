package com.marksandspencer.uitesting.elements

import com.marksandspencer.uitesting.Element
import com.marksandspencer.uitesting.Screen

object Nowhere : Screen {
    override val id: Element<*> get() = error("Nowhere has no id")
}
