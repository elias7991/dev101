# Todo App

This is a Flutter project that utilizes [FVM](https://fvm.app/) to manage Flutter versions. Make sure to have FVM installed to facilitate the management of Flutter versions in your development environment.
**Obs.: If you don't want to use fvm you must have version 3.22.1 of flutter which requires version 3.4.1 of dart**

## Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (recommended through FVM)
- [FVM](https://fvm.app/documentation/getting-started/installation) installed on your machine

## Installing FVM

If you haven't installed FVM yet, you can do so using the following command:

```bash
choco install fvm
```
## Use fvm
You must install fvm and follow these steps
1. Make sure you have fvm installed, if not, you can activate it with the command
   ```bash
   dart pub global activate fvm
   ```
2. Install flutter version with fvm
   ```bash
   fvm install 3.22.1
   ```
3. If you want to verify that the installation was successful you can run
   ```bash
   fvm list
   ```
   If you have more versions, execute the following command to see which one is being used
   ```bash
   fvm flutter --version
   ```
4. Use the correct version of flutter
   ```bash
   fvm use 3.22.1
   ```
5. For run the project with fvm
   ```bash
   fvm flutter run
   ```


## Using VsCode
You just have to go to the **Execution and Debugging** section and choose ***Debug*** or ***Debug with FVM*** as appropriate.