allprojects {
    repositories {
        google()
        mavenCentral()
        maven("https://nexus.gravity-engine.com/repository/maven-releases/")
        maven("https://nexus.gravity-engine.com/repository/maven-snapshots/")
        maven("https://developer.huawei.com/repo")
        maven("https://developer.hihonor.com/repo")
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
