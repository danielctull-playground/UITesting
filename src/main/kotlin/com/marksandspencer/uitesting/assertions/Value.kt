package com.marksandspencer.uitesting.assertions

import com.marksandspencer.uitesting.Query
import com.marksandspencer.uitesting.Screen
import com.marksandspencer.uitesting.State

fun <Content : Screen, Value> State<Content>.expect(
    query: Content.() -> Query<Value>,
    isEqualTo: Value,
): State<Content> {
    val q = content.query()
    val value = q(compose)
    if (value != isEqualTo) {
        throw IncorrectValue(value, isEqualTo)
    }
    return this
}

class IncorrectValue internal constructor(
    val actual: Any?,
    val expected: Any?,
) : AssertionError("Value is incorrect. Was $actual expected: $expected")
