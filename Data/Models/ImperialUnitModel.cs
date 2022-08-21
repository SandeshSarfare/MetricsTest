using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using MetricsApp.Data.Enums;

namespace MetricsApp.Data.Models
{
    public class ImperialUnitModel
    {
        [Required]
        public string ImperialUnit { get; set; }


        [Required]
        public string MetricUnit { get; set; }

        [Required]
        public int Value { get; set; }
    }
}
