using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace MetricsApp.Data.Enums
{
    [JsonConverter(typeof(JsonStringEnumConverter))]
    public enum MetricUnitEnum
    {
        [Description("Millimeter")]
        Millimeter = 1,

        [Description("Centimeter")]
        Centimeter = 2,

        [Description("Meter")]
        Meter = 3,

        [Description("Kilometer")]
        kilometer = 4,
        [Description("Square Centimeter")]
        SquareCentimeter = 9,

        [Description("SquareMeter")]
        SquareMeter = 10,

        [Description("Hectare")]
        Hectare = 11,

        [Description("Square Kilometer")]
        SquareKilometer = 12,

    }

    public enum UnitTypes
    {
        Metric = 1,
        Imperial = 2
    }
}
