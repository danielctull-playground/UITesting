package com.marksandspencer.uitesting

import androidx.compose.ui.test.runComposeUiTest
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.marksandspencer.uitesting.app.ExampleApp
import com.marksandspencer.uitesting.assertions.expect
import com.marksandspencer.uitesting.actions.navigate
import com.marksandspencer.uitesting.actions.tap
import com.marksandspencer.uitesting.actions.type
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class ExampleTest {

    @Test
    fun loginFlow() = runComposeUiTest {
        setContent { ExampleApp() }

        launch<MainScreen>()
            .activity("Login") {
                it
                    .type("daniel") { username }
                    .type("secret", into = MainScreen::password)
                    .tap { agreement }
                    .navigate { login }
            }
            .expect({ title.value }, isEqualTo = "hello, daniel")
    }
}
