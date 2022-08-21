using MetricsApp.Data.Models;
using MetricsApp.Helper;
using MetricsApp.Models;
using MetricsApp.Repository.Implementation;
using MetricsApp.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MetricsApp.Data.Enums;

namespace MetricsApp.Service
{
    public class RepositoryService : IRepositoryService
    {
        private readonly IConversionUnitsRepository cunitsRepository;
        private readonly IUnitsRepository unitsRepository;

        public RepositoryService()
        {
            this.cunitsRepository = new ConversionUnitsRepository(new MetricsDBContext());
            this.unitsRepository = new UnitsRepository(new MetricsDBContext());
        }

        public dynamic ConvertUnits(dynamic query, bool isToMetricConversion)
        {
            var units = unitsRepository.GetUnitsByTypes(query.MetricUnit, query.ImperialUnit);
            bool isTemp = query.MetricUnit == "Celsius";
            var metricUnitId = ((IEnumerable<Unit>)units).FirstOrDefault(u => u.UnitType == (int)UnitTypes.Metric).Id;
            var imperialUnitId = ((IEnumerable<Unit>)units).FirstOrDefault(u => u.UnitType == (int)UnitTypes.Imperial).Id;
            var conversionRates = cunitsRepository.GetConversionDetailsByUnitTypes(metricUnitId, imperialUnitId);
            var result = isToMetricConversion ? Converter.ImperialToMetric(query.Value, conversionRates.ConversionRate, isTemp) :
                Converter.MetricToImperial(query.Value, conversionRates.ConversionRate, isTemp);
            return result;
        }
    }
}
