package com.marksandspencer.uitesting

import androidx.compose.ui.test.ComposeUiTest

class Query<Value> internal constructor(
    private val action: (ComposeUiTest) -> Value,
) {

    operator fun invoke(test: ComposeUiTest): Value = action(test)

    fun <New> map(transform: (Value) -> New): Query<New> =
        Query { transform(action(it)) }
}
