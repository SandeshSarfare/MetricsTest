using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MetricsApp.Models;
using MetricsApp.Repository.Interfaces;

namespace MetricsApp.Repository.Implementation
{
    public class ConversionUnitsRepository : IConversionUnitsRepository
    {
        private bool disposed = false;
        private MetricsDBContext dbContext;

        public ConversionUnitsRepository(MetricsDBContext context)
        {
            this.dbContext = context;
        }

        public void Dispose(bool disposing)
        {
            if (!this.disposed && disposing)
            {
                dbContext.Dispose();
            }
            this.disposed = true;

        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);

        }

        public IEnumerable<ConversionUnit> GetAllConversionUnits()
        {
            return dbContext.ConversionUnits.ToList();
        }

        public ConversionUnit GetConversionDetailsByUnitTypes(int metricUnit, int imperialUnit)
        {
            var conversionDetails = (from cUnits in dbContext.ConversionUnits
                                     where cUnits.ImperialUnitId == imperialUnit && cUnits.MetricUnitId == metricUnit
                                     select cUnits
                                     ).FirstOrDefault();
            return conversionDetails;
        }

        public ConversionUnit GetConversionUnitById(int Id)
        {
            return dbContext.ConversionUnits.Find(Id);
        }
    }
}
