package com.marksandspencer.uitesting

import com.marksandspencer.uitesting.elements.Text

class DetailScreen : Screen {
    override val id: Element get() = title
    val title = Text("detail-title")
}
