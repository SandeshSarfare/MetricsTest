using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MetricsApp.Service
{
    public interface IRepositoryService
    {
        dynamic ConvertUnits(dynamic query, bool isToMetricConversion);
    }
}
