plugins {
    id("com.android.library") version "8.9.0"
    id("org.jetbrains.kotlin.android") version "2.1.0"
    id("org.jetbrains.kotlin.plugin.compose") version "2.1.0"
}

android {
    namespace = "com.marksandspencer.uitesting"
    compileSdk = 35

    defaultConfig {
        minSdk = 21
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
        freeCompilerArgs += "-opt-in=androidx.compose.ui.test.ExperimentalTestApi"
    }
}

dependencies {
    api(platform("androidx.compose:compose-bom:2024.11.00"))
    api("androidx.compose.ui:ui-test")

    androidTestImplementation("androidx.compose.ui:ui-test-junit4")
    androidTestImplementation("androidx.compose.ui:ui-test-manifest")
    androidTestImplementation("androidx.compose.material3:material3")
    androidTestImplementation("androidx.activity:activity-compose:1.9.3")
    androidTestImplementation("androidx.test.ext:junit:1.2.1")
}
