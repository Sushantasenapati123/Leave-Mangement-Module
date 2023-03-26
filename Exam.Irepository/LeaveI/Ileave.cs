using Exam.Domain.Sports;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Exam.Irepository.LeaveI
{
   public interface Ileave
    {
        Task<int> insert(Leave p);
      

        Task<List<Leave>> BindEmplyee(int id);
      public  Task<List<Leave>> BindLeaveStatus(int id);


        Task<List<Leave>> BindLeaveType();
     

        Task<Leave> GetById(int id);
    }
}
