using System;
using System.Collections.Generic;

#nullable disable

namespace MetricsApp.Models
{
    public partial class ConversionUnit
    {
        public int Id { get; set; }
        public int QuantityId { get; set; }
        public decimal ConversionRate { get; set; }
        public int MetricUnitId { get; set; }
        public int ImperialUnitId { get; set; }
        public bool IsActive { get; set; }
    }
}
