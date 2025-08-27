plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

android {
    namespace = "com.example.pregnancy_companion"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.pregnancy_companion"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

// ✅ Apply the Flutter Gradle script directly
apply(from = "$rootDir/../flutter.gradle")

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib:1.9.24")

    // ✅ Desugaring fix for flutter_local_notifications
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
}
