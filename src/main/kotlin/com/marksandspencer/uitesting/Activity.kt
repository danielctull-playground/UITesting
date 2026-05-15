package com.marksandspencer.uitesting

import android.util.Log

fun <Content : Screen, Return : Screen> State<Content>.activity(
    name: String,
    action: (State<Content>) -> State<Return>,
): State<Return> {
    Log.d("UITesting", "Activity: $name — start")
    return action(this).also {
        Log.d("UITesting", "Activity: $name — end")
    }
}
