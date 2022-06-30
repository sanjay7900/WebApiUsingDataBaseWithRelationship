using AutoMapper;
using WebApiDbLayerWithRelationShip.Model;
using WebApiWithRelationShipOneToManyAssignment.ApiModel;


namespace WebApiWithRelationShipOneToManyAssignment.Mapper
{
    public class MapperProfile:Profile
    {
        public MapperProfile()
        {
            CreateMap<Teacher, TeacherModel>().ReverseMap();
            CreateMap<ClassRoom, ClassRoomModel>().ReverseMap();
        }
    }
}
