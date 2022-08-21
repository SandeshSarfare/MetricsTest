using FluentValidation;
using MetricsApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MetricsApp.Helper
{
    public class UnitsQueryValidator : AbstractValidator<UnitsQueryValidator>
    {
        public UnitsQueryValidator(MetricsDBContext database1Context)
        {

        }
    }



}
