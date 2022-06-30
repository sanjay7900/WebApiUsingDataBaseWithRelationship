using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApiDbLayerWithRelationShip.Model;

namespace WebApiDbLayerWithRelationShip
{
    public class DbContextLayerForRelation:DbContext
    {
        public DbSet<Teacher> Teachers { get; set; }
        public DbSet<ClassRoom> ClassRooms { get; set; }
        public DbContextLayerForRelation() { }
        public DbContextLayerForRelation(DbContextOptions options) : base(options) { }  
        protected override void OnConfiguring(DbContextOptionsBuilder dbContextOptionsBuilder)
        {
            dbContextOptionsBuilder.UseSqlServer(@"Data Source=DESKTOP-AMR2CQS\MSSQLSERVER01;Initial Catalog=WebApiDatabaseWithRelation;Integrated Security=True");
        }


    }
}
