namespace WebApiWithRelationShipOneToManyAssignment.ApiModel
{
    public class BindingTheTeacherAndClassRoom
    {
        public TeacherModel TeacherModel { get; set; }
        public List<ClassRoomModel> ClassRoomModelList { get; set; }
    }
}
