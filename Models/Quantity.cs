using System;
using System.Collections.Generic;

#nullable disable

namespace MetricsApp.Models
{
    public partial class Quantity
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool? IsActive { get; set; }
    }
}
