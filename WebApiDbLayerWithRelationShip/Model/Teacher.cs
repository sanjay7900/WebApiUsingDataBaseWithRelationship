using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApiDbLayerWithRelationShip.Model
{
    public class Teacher
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int TeacherID { get; set; }
        [Column(TypeName ="varchar(30)")]
        public string? TeacherName { get; set; } 
        [Column(TypeName ="nvarchar(100)")]
        public string? Address { get; set; }
        
        
        public ICollection<ClassRoom> ClassRoomsList { get; set; }    

    }
}
