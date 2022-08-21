using System;
using System.Collections.Generic;

#nullable disable

namespace MetricsApp.Models
{
    public partial class Unit
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Symbol { get; set; }
        public int QuantityId { get; set; }
        public int UnitType { get; set; }
    }
}
