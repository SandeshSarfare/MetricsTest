using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MetricsApp.Data.Models;
using MetricsApp.Repository.Interfaces;
using MetricsApp.Repository.Implementation;
using MetricsApp.Models;
using MetricsApp.Helper;
using MetricsApp.Service;

namespace MetricsApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConversionController : ControllerBase
    {
        private readonly RepositoryService repositoryService;

        public ConversionController()
        {
            this.repositoryService = new RepositoryService();
        }

        [HttpGet("/api/ImperialToMetric")]
        public dynamic ImperialToMetric([FromQuery] ImperialUnitModel query)
        {
            var result = repositoryService.ConvertUnits(query, true);
            if (result == null)
            {
                return NotFound();
            }
            return Ok(result);
        }


        [HttpGet("/api/MetricToImperial")]
        public dynamic MetricToImperial([FromQuery] MetricUnitModel query)
        {
            var result = repositoryService.ConvertUnits(query, false);
            if (result == null)
            {
                return NotFound();
            }
            return Ok(result);
        }
    }
}
