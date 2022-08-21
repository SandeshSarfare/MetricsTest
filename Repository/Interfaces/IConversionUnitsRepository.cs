using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MetricsApp.Models;

namespace MetricsApp.Repository.Interfaces
{
    interface IConversionUnitsRepository : IDisposable
    {
        ConversionUnit GetConversionUnitById(int Id);
        IEnumerable<ConversionUnit> GetAllConversionUnits();

        ConversionUnit GetConversionDetailsByUnitTypes(int metricUnit, int imperialUnit);
    }
}
