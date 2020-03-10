---
layout: post
title: "The framework 'Microsoft.NETCore.App', version 'x.x.x' was not found"
date: "2020-03-03 14:19:28 +0800"
categories: howto dotnet framework
---

# What Happened
Recently when I checked out DiffPlex and try to run its demo program, I see the following errors in the console:

```
It was not possible to find any compatible framework version
The framework 'Microsoft.NETCore.App', version '1.1.0' was not found.
- The following frameworks were found:
    2.0.9 at [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
    ... <omitted>
    3.1.2 at [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]

You can resolve the problem by installing the specified framework and/or SDK.

The specified framework can be found at:
- https://aka.ms/dotnet-core-applaunch?framework=Microsoft.NETCore.App&framework_version=1.1.0&arch=x64&rid=win10-x64
```


In debug output, the following message is shown:
```
The target process exited without raising a CoreCLR started event. Ensure that the target process is configured to use .NET Core. This may be expected if the target process did not run on .NET Core.

The program '[10948] dotnet.exe' has exited with code -2147450730 (0x80008096).
```

The project property is as below (.csproj):
```xml
<PropertyGroup>
  <OutputType>Exe</OutputType>
  <TargetFramework>netcoreapp1.1</TargetFramework>
  <RuntimeFrameworkVersion>1.1.0</RuntimeFrameworkVersion>
</PropertyGroup>
```

# Why
.NetCore 1.x sdk/runtime is not installed in my computer.

So, while the project can be build stil using the latest sdk, there is no runtime for it to run.

# To Fix It
Update the TargetFramework & RuntimeFrameworkVersion to the compatible versions that have been installed in the local pc.

The project property is now updated to below (.csproj):
```xml
<PropertyGroup>
  <OutputType>Exe</OutputType>
  <TargetFramework>netcoreapp3.1</TargetFramework>
  <RuntimeFrameworkVersion>3.1.2</RuntimeFrameworkVersion>
</PropertyGroup>
```

If you cannot update the project, you need to install the missing sdk/runtime in your pc.

# Appendix
##### Check installed sdk & runtime

```bat
> dotnet --list-sdks
2.1.202 [C:\Program Files\dotnet\sdk]
... <omitted>
3.1.100 [C:\Program Files\dotnet\sdk]

> dotnet --list-runtimes
Microsoft.NETCore.App 2.0.9 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
... <omitted>
Microsoft.NETCore.App 3.1.2 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
```
