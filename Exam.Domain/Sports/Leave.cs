using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Exam.Domain.Sports
{
   public class Leave
    {
		[Key]
		public int id { get; set; } = 0;
		public int restML { get; set; } = 0;
		public int restCL { get; set; } = 0;

		public string FROM_DATE { get; set; } = null;
		public string TO_DATE { get; set; } = null;

		public int LeaveTyp_id { get; set; } = 0;
		public int Emp_Code { get; set; } = 0;
		public int Emp_desig { get; set; } = 0;
		[Required]
		public string Leave_Type { get; set; } = null;
		public string Emp_Name { get; set; } = null;
		public string DesignationName { get; set; } = null;
		public string Documents { get; set; } = null;

		public int Leave_day { get; set; } = 0;

		public string Reason { get; set; }

	}
}
