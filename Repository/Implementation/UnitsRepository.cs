using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MetricsApp.Models;
using MetricsApp.Repository.Interfaces;

namespace MetricsApp.Repository.Implementation
{
    public class UnitsRepository : IUnitsRepository
    {
        private bool disposed = false;
        private MetricsDBContext dbContext;

        public UnitsRepository(MetricsDBContext context)
        {
            this.dbContext = context;
        }
        public Unit GetUnitById(int Id)
        {
            return dbContext.Units.Find(Id);
        }

        public IEnumerable<Unit> GetUnitsByTypes(string metricType, string imperialType)
        {
            return dbContext.Units.Where(u => u.Name == metricType || u.Name == imperialType).ToList();
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

       
    }
}
