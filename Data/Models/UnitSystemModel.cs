using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MetricsApp.Data.Models
{
    public class UnitSystemModel
    {

        [Required]
        public string MetricUnit { get; set; }

        [Required]
        public string ImperialUnit { get; set; }

        [Required]
        public int Value { get; set; }
    }
}
