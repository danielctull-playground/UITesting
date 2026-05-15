package com.marksandspencer.uitesting

import com.marksandspencer.uitesting.elements.Button
import com.marksandspencer.uitesting.elements.Checkbox
import com.marksandspencer.uitesting.elements.SecureTextField
import com.marksandspencer.uitesting.elements.Text
import com.marksandspencer.uitesting.elements.TextField

class MainScreen : Screen {
    override val id: Element<*> get() = title
    val title = Text("main-title")
    val username = TextField("username")
    val password = SecureTextField("password")
    val agreement = Checkbox("agreement")
    val login = Button("login") { DetailScreen() }
}
