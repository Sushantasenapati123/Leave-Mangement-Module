using Dapper;
using Exam.Domain.Sports;
using Exam.Irepository.LeaveI;
using FstMonthExam.IRepository.Factory;
using PathoLab.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace Exam.Repository.LeaveFolder
{
   public class LeaveRepo: RepositoryBase, Ileave
    {
        public LeaveRepo(IConnectionFactory connectionFactory) : base(connectionFactory)
        {
        }
       
        public async Task<List<Leave>> BindLeaveType()
        {
            try
            {
                DynamicParameters ObjParm = new DynamicParameters();
                ObjParm.Add("@mode", "BindLeave");
                var query = "Emp_Leave";
                ObjParm.Add("@PMSGOUT", dbType: DbType.String, direction: ParameterDirection.Output, size: 5215585);

                var GetAppById = Connection.Query<Leave>(query, ObjParm, commandType: CommandType.StoredProcedure).AsList();
                return GetAppById;


            }
            catch (Exception ex)
            {
                return null;

            }
        }
     

        public async Task<List<Leave>> BindEmplyee(int id)
        {
            try
            {

                DynamicParameters ObjParm = new DynamicParameters();
                ObjParm.Add("@Emp_Code", id);
                ObjParm.Add("@mode", "BindEmployee");
                var query = "Emp_Leave";
                ObjParm.Add("@PMSGOUT", dbType: DbType.String, direction: ParameterDirection.Output, size: 5215585);

                var GetAppById = Connection.Query<Leave>(query, ObjParm, commandType: CommandType.StoredProcedure).AsList();
                return GetAppById;

            }
            catch (Exception ex)
            {
                return null;

            }
        }
        public async Task<List<Leave>> BindLeaveStatus(int id)
        {
            try
            {

                DynamicParameters ObjParm = new DynamicParameters();
                ObjParm.Add("@Emp_Code", id);
                ObjParm.Add("@mode", "LeaveStatus");
                var query = "Emp_Leave";
                ObjParm.Add("@PMSGOUT", dbType: DbType.String, direction: ParameterDirection.Output, size: 5215585);

                var GetAppById = Connection.Query<Leave>(query, ObjParm, commandType: CommandType.StoredProcedure).AsList();
                return GetAppById;

            }
            catch (Exception ex)
            {
                return null;

            }
        }


        public async Task<Leave> GetById(int PatientID)
        {
            try
            {

                DynamicParameters ObjParm = new DynamicParameters();
                ObjParm.Add("@Registration_Id", PatientID);
                ObjParm.Add("@mode", "GetById");
                ObjParm.Add("@PMSGOUT", dbType: DbType.String, direction: ParameterDirection.Output, size: 5215585);


                var query = "Leaves";
                var GetAppById = Connection.Query<Leave>(query, ObjParm, commandType: CommandType.StoredProcedure).AsList();
                return GetAppById[0];



            }
            catch (Exception ex)
            {
                return null;

            }
        }


        public async Task<int> insert(Leave om)
        {
            try
            {
                DynamicParameters param = new DynamicParameters();

                param.Add("@Emp_Code", om.Emp_Code);
                param.Add("@LeaveTyp_id", om.Leave_Type);
              
                param.Add("@Documents", om.Documents);
                param.Add("@Reason", om.Reason);
                param.Add("@FROM_DATE", om.FROM_DATE);
                param.Add("@TO_DATE", om.TO_DATE);
             
                param.Add("@mode", "insert");
                param.Add("@PMSGOUT", dbType: DbType.String, direction: ParameterDirection.Output, size: 5215585);

                Connection.Execute("[Emp_Leave]", param, commandType: CommandType.StoredProcedure);
                int x = Convert.ToInt32(param.Get<string>("@PMSGOUT"));

                return x;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }



    }
}

   