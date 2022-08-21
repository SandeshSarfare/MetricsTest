using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MetricsApp.Models;
using Microsoft.OpenApi.Any;

namespace MetricsApp.Helper
{
    
    public class UnitParameterFilter : Swashbuckle.AspNetCore.SwaggerGen.IParameterFilter
    {
        readonly IServiceScopeFactory _serviceScopeFactory;

        public UnitParameterFilter(IServiceScopeFactory serviceScopeFactory)
        {
            _serviceScopeFactory = serviceScopeFactory;
        }

        public void Apply(OpenApiParameter parameter, ParameterFilterContext context)
        {
            if (parameter.Name.Equals("MetricUnit", StringComparison.InvariantCultureIgnoreCase))
            {

                using (var scope = _serviceScopeFactory.CreateScope())
                {
                    var metricsContext = scope.ServiceProvider.GetRequiredService<MetricsDBContext>();
                    IEnumerable<Unit> units = metricsContext.Units.Where(x=>x.UnitType == 1).ToArray();

                    parameter.Schema.Enum = units.Select(p => new OpenApiString(p.Name)).ToList<IOpenApiAny>();

                }
            }

            if (parameter.Name.Equals("ImperialUnit", StringComparison.InvariantCultureIgnoreCase))
            {

                using (var scope = _serviceScopeFactory.CreateScope())
                {
                    var metricsContext = scope.ServiceProvider.GetRequiredService<MetricsDBContext>();
                    IEnumerable<Unit> units = metricsContext.Units.Where(x => x.UnitType == 2).ToArray();

                    parameter.Schema.Enum = units.Select(p => new OpenApiString(p.Name)).ToList<IOpenApiAny>();

                }
            }
            
        }

    }


}
