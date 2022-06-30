using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using WebApiDbLayerWithRelationShip;
using WebApiDbLayerWithRelationShip.Model;
using WebApiWithRelationShipOneToManyAssignment.ApiModel;

namespace WebApiWithRelationShipOneToManyAssignment.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TeachersController : ControllerBase
    {
        private readonly DbContextLayerForRelation _context;
        private readonly IMapper _mapper;

        public TeachersController(DbContextLayerForRelation context,IMapper mapper)
        {
            _context = context;
            _mapper = mapper;   
        }

        // GET: api/Teachers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Teacher>>> GetTeachers()
        {
          if (_context.Teachers == null)
          {
              return NotFound();
          }
            //var teachersList = 
            //var json=JsonConvert.SerializeObject(item);
            //List<Teacher> result = new List<Teacher>();
            //List<ClassRoom> classes = new List<ClassRoom>();
            //foreach (var items in item)
            //{
            //    Console.WriteLine(items.TeacherName);
            //    Console.WriteLine(items.Address);
            //    foreach (var cls in items.classRooms)
            //    {
            //        Console.WriteLine(cls.Name.ToString());
            //    }


            //}
            //Console.WriteLine("jjjjjjkkkkkkkkkkkkkkkkkkkk"+json);

            // return await _context.Teachers.ToListAsync();
            var obj = _context.Teachers.Include(t => t.ClassRoomsList).ToList();
           return Ok(_mapper.Map<List<Teacher>>(obj));
        }

        // GET: api/Teachers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Teacher>> GetTeacher(int id)
        {
          if (_context.Teachers == null)
          {
              return NotFound();
          }
            //var teacher = await _context.Teachers.FindAsync(id);
            var teacher = _context.Teachers.Where(t=>t.TeacherID == id).Include(cls=>cls.ClassRoomsList).FirstOrDefault();
            if (teacher == null)
            {
                return NotFound();
            }

            //return Ok(teacher);
            return _mapper.Map<Teacher>(teacher);   
        }

        // PUT: api/Teachers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTeacher(int id, BindingTheTeacherAndClassRoom teacher)
        {
            var obj = _mapper.Map<Teacher>(teacher.TeacherModel);
            var list = _mapper.Map<List<ClassRoom>>(teacher.ClassRoomModelList);
            var up = _context.Teachers.Where(t => t.TeacherID == id).Include(c => c.ClassRoomsList).FirstOrDefault();
            
            
            up.Address = obj.Address;
            up.TeacherName=obj.TeacherName;
            
            up.ClassRoomsList=list;
            if (id != obj.TeacherID)
            {
                return BadRequest();
            }
            _context.Update(up);
            //_context.Entry(up).State = EntityState.Modified;
            

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TeacherExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Teachers
        // To protect from overposting attacks,Task<ActionResult<Teacher>>  see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Teacher>> PostTeacher(BindingTheTeacherAndClassRoom getInfo)
        {
          if (_context.Teachers == null)
          {
              return Problem("Entity set 'DbContextLayerForRelation.teachers'  is null.");
          }
            var teacherobj= _mapper.Map<Teacher>(getInfo.TeacherModel);
            var classroomList = _mapper.Map<List<ClassRoom>>(getInfo.ClassRoomModelList);
            teacherobj.ClassRoomsList = classroomList;
             _context.Teachers.Add(teacherobj);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTeacher", new { id = teacherobj.TeacherID }, teacherobj);
        }

        // DELETE: api/Teachers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTeacher(int id)
        {
            if (_context.Teachers == null)
            {
                return NotFound();
            }
            var teacher =  await _context.Teachers.FindAsync(id);
           // var clsList =  _context.ClassRooms.Where(c=>c.Teacher==teacher).ToList();
            if (teacher == null)
            {
                return NotFound();
            }
            
            _context.Teachers.Remove(teacher);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TeacherExists(int id)
        {
            return (_context.Teachers?.Any(e => e.TeacherID == id)).GetValueOrDefault();
        }
    }
}
