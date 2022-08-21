# MetricsTest
This App convert Metric units to Imperial units and vice versa

**Technologies used in this project**
* Net Core v5.0
* SQL Server

To run this application please follow below instructions

1. run `git clone https://github.com/SandeshSarfare/MetricsTest.git` to clone the project from command line.
2. run `dotnet retore` or rebuild the solution to restore packages.
3. run script provided in 'MetricDB.sql' file to create database and tables with units and conversion rates data.
4. change the SqlConnectionString in appsettings.json

**Nuget used for below dependencies**
* Swagger
* Microsoft.EntityFrameworkCore Tools
* NewtonsoftJson
