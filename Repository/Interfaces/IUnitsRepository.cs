using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MetricsApp.Models;


namespace MetricsApp.Repository.Interfaces
{
    interface IUnitsRepository : IDisposable
    {
        Unit GetUnitById(int Id);

        IEnumerable<Unit> GetUnitsByTypes(string metricType, string imperialType);

    }
}
