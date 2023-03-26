using Exam.Domain.Sports;
using Exam.Irepository.LeaveI;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Exam.Web.Controllers
{
    public class LeaveController : Controller
    {
        private readonly IWebHostEnvironment _environment;
        private readonly Ileave log;

        public LeaveController(Ileave _log, IWebHostEnvironment environment)
        {
            _environment = environment;
            log = _log;
        }
        [HttpPost]
        public IActionResult UploadImage(IFormFile MyUploader)
        {
            if (MyUploader != null)
            {
                string uploadsFolder = Path.Combine(_environment.WebRootPath, "prodimage");

                string filePath = Path.Combine(uploadsFolder, MyUploader.FileName);

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    MyUploader.CopyTo(fileStream);
                }

                return new ObjectResult(new { status = "success" });
            }
            return new ObjectResult(new { status = "fail" });

        }
        public async Task<IActionResult> LeaveApplicationForm()
        {
            List<Leave> pc1 = new List<Leave>();
             Leave ds = new Leave();//////for search
            pc1 = await log.BindLeaveType();
            pc1.Insert(0, new Leave { id = 0, Leave_Type = "Select" });

            ViewBag.LeaveType = pc1;

            //ViewBag.Result = await log.GetAll(new Spot());

            return View();
        }
         [HttpPost]
        public async Task<JsonResult> Add(Leave entity)
        {
            string authors = entity.Documents;
             
            if(authors==null)
            {
                
                    authors = "C:\\fakepath\\NoPhoto.pdf";
                
            }
            string  typ = authors.Split(".")[1];

            if(typ=="pdf" || typ=="jpeg")
            
            {
                string[] files =authors.Split('\\');
                entity.Documents = "prodimage/" + files[files.Length - 1];

            }
            else
            {
                return Json("Document in pdf and jpeg is allowed");
            }
           

            int retMsg = await log.insert(entity);

                if (retMsg == 1)
                {
                    return Json("Record Saved Successfully");
                }
                else if (retMsg == 2)
                {
                    return Json("Not Allowed");
                }
            else if (retMsg == 3)
            {
                return Json("No. of Leave are noavailable");
            }
            else
                {
                    return Json("Record Already Exist");
                }

            
          
        }
        [HttpGet]
        public async Task<IActionResult> BindEmployee(int clubid)
        {
          
            var Slots = log.BindEmplyee(clubid).Result;
            return Ok(JsonConvert.SerializeObject(Slots));
        }
        [HttpGet]
        public async Task<IActionResult> BindleaveStatus(int clubid)
        {
            //List<Spot> pc4 = new List<Spot>();
            //pc4 = await log.BindSportByClubId(clubid);
            //pc4.Insert(0, new Spot { sport_Id = 0, sprot_name = "Select" });
            //ViewBag.Catagory = pc4;

            var Slots = log.BindLeaveStatus(clubid).Result;
            return Ok(JsonConvert.SerializeObject(Slots));
        }

    }
}
