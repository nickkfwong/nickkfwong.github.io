---
layout: post
title: "Nuget content files not copied to output bin directory in Visual Studio 2017"
date: "2020-03-09 10:09:42 +0800"
---
open VS with a fresh checked out repo -> build (& so restore) -> nuget content files is not copied to bin Directory

open VS with a fresh checked out repo -> restore all nuget package -> close VS -> open VS again -> build -> nuget content files are now copied.

- Seems visual studio does not detect the change in content files and thus not copying in the series of steps
- no issue if you run with a msbuild
