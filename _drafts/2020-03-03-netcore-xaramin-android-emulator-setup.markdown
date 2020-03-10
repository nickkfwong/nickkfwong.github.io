---
layout: post
title: "Visual Studio Android Emulator Setup on Win10 Ryzen"
date: "2020-03-03 19:26:36 +0800"
categories: howto dotnet xaramin
---
Platform
```
AMD Ryzen 2700X, Windows 10
Visual Studio Community 2019
```

Enable below 3 windows feature
```
   1. Hyper-V
   2. Windows Hypervisor Platform
   3. Windows Sandbox
```

Fix any Android SDK Tools from Visual 2019
```
Tools -> Android -> Android SDK Manager

-> Install NDK (what?)

Create Android 9 Device
Create Android 10 Device
-> Auto download
```

Error:
```
Severity	Code	Description	Project	File	Line	Suppression State
Warning		Using Fast Deployment and AOT at the same time is not recommended. Use Fast Deployment for Debug configurations and AOT for Release configurations.	FirstMobileBlazorBindingsApp.Android
```


Elements
- Frame - when to use?
- StackLayout Margin...not used

- Entry -> input entry

- ScrollView

- Switch -> boolean switch


Bindings
- bind-Text => Two-way binding??
- <Label @bind-Text> => not working. => need
-   <Label Text="@(value)"
- <Entry @bind-Text> => ok!

---
Inject Parameter into Component Property as Parameter
<Component Item="xxx"> </Component>

=> Component.razor
@code{
[Parameter] public Type Item { get;set; }
}

---
Reference a component into a variable
<Component @ref="Item"></Component>

@code{
Component referencedComponent;
}
---
Dependency Injection for Razor Component
.razor
@inject AppState AppState

..
AppState.GetData();

---
Database
- sqllite-net-pcl
- mongo realm ?

where is the data file saved in phone?


---
publish
Change to release mode
- Archive
- Sign apk
- Save as apk

Release configurations
- ProGuard -> reduce java bytecode
- Linker -> reduce managed assemblies
