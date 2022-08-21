using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MetricsApp.Repository;

namespace MetricsApp.Helper
{
    public static class Converter
    {

        public static dynamic ImperialToMetric(dynamic unitValue, dynamic conversionRate, bool isTemperature)
        {
            if (isTemperature)
            {
                return Math.Round((unitValue - 32) / 1.8, 2);
            }
            else
            {
                return unitValue * conversionRate;
            }
        }

        public static dynamic MetricToImperial(dynamic unitValue, dynamic conversionRate, bool isTemperature)
        {
            if (isTemperature)
            {
                return Math.Round((unitValue * 1.8) + 32, 2);
            }
            else
            {

                return unitValue / conversionRate;
            }
        }

    }
}
