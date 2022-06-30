�
oD:\aspdotnet\CSharpOPPsRepo\WebApiWithRelationShipOneToManyAssignment\ApiModel\BindingTheTeacherAndClassRoom.cs
	namespace 	5
)WebApiWithRelationShipOneToManyAssignment
 3
.3 4
ApiModel4 <
{ 
public 

class )
BindingTheTeacherAndClassRoom .
{ 
public 
TeacherModel 
TeacherModel (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
List 
< 
ClassRoomModel "
>" #
ClassRoomModelList$ 6
{7 8
get9 <
;< =
set> A
;A B
}C D
} 
} �
`D:\aspdotnet\CSharpOPPsRepo\WebApiWithRelationShipOneToManyAssignment\ApiModel\ClassRoomModel.cs
	namespace 	5
)WebApiWithRelationShipOneToManyAssignment
 3
.3 4
ApiModel4 <
{ 
public 

class 
ClassRoomModel 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
? 
Name 
{ 
get !
;! "
set# &
;& '
}( )
} 
} �
^D:\aspdotnet\CSharpOPPsRepo\WebApiWithRelationShipOneToManyAssignment\ApiModel\TeacherModel.cs
	namespace 	5
)WebApiWithRelationShipOneToManyAssignment
 3
.3 4
ApiModel4 <
{ 
public 

class 
TeacherModel 
{ 
public 
int 
	TeacherId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
? 
TeacherName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
? 
Address 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 �J
gD:\aspdotnet\CSharpOPPsRepo\WebApiWithRelationShipOneToManyAssignment\Controllers\TeachersController.cs
	namespace 	5
)WebApiWithRelationShipOneToManyAssignment
 3
.3 4
Controllers4 ?
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
TeachersController #
:$ %
ControllerBase& 4
{ 
private 
readonly %
DbContextLayerForRelation 2
_context3 ;
;; <
private 
readonly 
IMapper  
_mapper! (
;( )
public 
TeachersController !
(! "%
DbContextLayerForRelation" ;
context< C
,C D
IMapperD K
mapperL R
)R S
{ 	
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
[ 	
HttpGet	 
] 
public   
async   
Task   
<   
ActionResult   &
<  & '
IEnumerable  ' 2
<  2 3
Teacher  3 :
>  : ;
>  ; <
>  < =
GetTeachers  > I
(  I J
)  J K
{!! 	
if""
 
("" 
_context"" 
."" 
Teachers"" 
==""  "
null""# '
)""' (
{##
 
return$$ 
NotFound$$ 
($$ 
)$$ 
;$$  
}%%
 
return77 
await77 
_context77 !
.77! "
Teachers77" *
.77* +
ToListAsync77+ 6
(776 7
)777 8
;778 9
}88 	
[;; 	
HttpGet;;	 
(;; 
$str;; 
);; 
];; 
public<< 
async<< 
Task<< 
<<< 
ActionResult<< &
<<<& '
Teacher<<' .
><<. /
><</ 0

GetTeacher<<1 ;
(<<; <
int<<< ?
id<<@ B
)<<B C
{== 	
if>>
 
(>> 
_context>> 
.>> 
Teachers>> 
==>>  "
null>># '
)>>' (
{??
 
return@@ 
NotFound@@ 
(@@ 
)@@ 
;@@  
}AA
 
varBB 
teacherBB 
=BB 
awaitBB 
_contextBB  (
.BB( )
TeachersBB) 1
.BB1 2
	FindAsyncBB2 ;
(BB; <
idBB< >
)BB> ?
;BB? @
ifDD 
(DD 
teacherDD 
==DD 
nullDD 
)DD  
{EE 
returnFF 
NotFoundFF 
(FF  
)FF  !
;FF! "
}GG 
returnII 
teacherII 
;II 
}JJ 	
[NN 	
HttpPutNN	 
(NN 
$strNN 
)NN 
]NN 
publicOO 
asyncOO 
TaskOO 
<OO 
IActionResultOO '
>OO' (

PutTeacherOO) 3
(OO3 4
intOO4 7
idOO8 :
,OO: ;)
BindingTheTeacherAndClassRoomOO< Y
teacherOOZ a
)OOa b
{PP 	
varQQ 
objQQ 
=QQ 
_mapperQQ 
.QQ 
MapQQ !
<QQ! "
TeacherQQ" )
>QQ) *
(QQ* +
teacherQQ+ 2
.QQ2 3
TeacherModelQQ3 ?
)QQ? @
;QQ@ A
varRR 
listRR 
=RR 
_mapperRR 
.RR 
MapRR "
<RR" #
ListRR# '
<RR' (
	ClassRoomRR( 1
>RR1 2
>RR2 3
(RR3 4
teacherRR4 ;
.RR; <
ClassRoomModelListRR< N
)RRN O
;RRO P
objSS 
.SS 
ClassRoomsListSS 
=SS  
listSS! %
;SS% &
ifTT 
(TT 
idTT 
!=TT 
objTT 
.TT 
	TeacherIDTT #
)TT# $
{UU 
returnVV 

BadRequestVV !
(VV! "
)VV" #
;VV# $
}WW 
_contextYY 
.YY 
EntryYY 
(YY 
objYY 
)YY 
.YY  
StateYY  %
=YY& '
EntityStateYY( 3
.YY3 4
ModifiedYY4 <
;YY< =
try\\ 
{]] 
await^^ 
_context^^ 
.^^ 
SaveChangesAsync^^ /
(^^/ 0
)^^0 1
;^^1 2
}__ 
catch`` 
(`` (
DbUpdateConcurrencyException`` /
)``/ 0
{aa 
ifbb 
(bb 
!bb 
TeacherExistsbb "
(bb" #
idbb# %
)bb% &
)bb& '
{cc 
returndd 
NotFounddd #
(dd# $
)dd$ %
;dd% &
}ee 
elseff 
{gg 
throwhh 
;hh 
}ii 
}jj 
returnll 
	NoContentll 
(ll 
)ll 
;ll 
}mm 	
[qq 	
HttpPostqq	 
]qq 
publicrr 
asyncrr 
Taskrr 
<rr 
ActionResultrr &
<rr& '
Teacherrr' .
>rr. /
>rr/ 0
PostTeacherrr1 <
(rr< =)
BindingTheTeacherAndClassRoomrr= Z
getInforr[ b
)rrb c
{ss 	
iftt
 
(tt 
_contexttt 
.tt 
Teacherstt 
==tt  "
nulltt# '
)tt' (
{uu
 
returnvv 
Problemvv 
(vv 
$strvv X
)vvX Y
;vvY Z
}ww
 
varxx 

teacherobjxx 
=xx 
_mapperxx #
.xx# $
Mapxx$ '
<xx' (
Teacherxx( /
>xx/ 0
(xx0 1
getInfoxx1 8
.xx8 9
TeacherModelxx9 E
)xxE F
;xxF G
varyy 
classroomListyy 
=yy 
_mapperyy  '
.yy' (
Mapyy( +
<yy+ ,
Listyy, 0
<yy0 1
	ClassRoomyy1 :
>yy: ;
>yy; <
(yy< =
getInfoyy= D
.yyD E
ClassRoomModelListyyE W
)yyW X
;yyX Y

teacherobjzz 
.zz 
ClassRoomsListzz %
=zz& '
classroomListzz( 5
;zz5 6
_context{{ 
.{{ 
Teachers{{ 
.{{ 
Add{{ "
({{" #

teacherobj{{# -
){{- .
;{{. /
await|| 
_context|| 
.|| 
SaveChangesAsync|| +
(||+ ,
)||, -
;||- .
return~~ 
CreatedAtAction~~ "
(~~" #
$str~~# /
,~~/ 0
new~~1 4
{~~5 6
id~~7 9
=~~: ;

teacherobj~~< F
.~~F G
	TeacherID~~G P
}~~Q R
,~~R S

teacherobj~~T ^
)~~^ _
;~~_ `
} 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
DeleteTeacher
��) 6
(
��6 7
int
��7 :
id
��; =
)
��= >
{
�� 	
if
�� 
(
�� 
_context
�� 
.
�� 
Teachers
�� !
==
��" $
null
��% )
)
��) *
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
var
�� 
teacher
�� 
=
�� 
await
��  
_context
��! )
.
��) *
Teachers
��* 2
.
��2 3
	FindAsync
��3 <
(
��< =
id
��= ?
)
��? @
;
��@ A
if
�� 
(
�� 
teacher
�� 
==
�� 
null
�� 
)
��  
{
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
_context
�� 
.
�� 
Teachers
�� 
.
�� 
Remove
�� $
(
��$ %
teacher
��% ,
)
��, -
;
��- .
await
�� 
_context
�� 
.
�� 
SaveChangesAsync
�� +
(
��+ ,
)
��, -
;
��- .
return
�� 
	NoContent
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
private
�� 
bool
�� 
TeacherExists
�� "
(
��" #
int
��# &
id
��' )
)
��) *
{
�� 	
return
�� 
(
�� 
_context
�� 
.
�� 
Teachers
�� %
?
��% &
.
��& '
Any
��' *
(
��* +
e
��+ ,
=>
��- /
e
��0 1
.
��1 2
	TeacherID
��2 ;
==
��< >
id
��? A
)
��A B
)
��B C
.
��C D
GetValueOrDefault
��D U
(
��U V
)
��V W
;
��W X
}
�� 	
}
�� 
}�� �
]D:\aspdotnet\CSharpOPPsRepo\WebApiWithRelationShipOneToManyAssignment\Mapper\MapperProfile.cs
	namespace 	5
)WebApiWithRelationShipOneToManyAssignment
 3
.3 4
Mapper4 :
{ 
public		 

class		 
MapperProfile		 
:		 
Profile		 &
{

 
public 
MapperProfile 
( 
) 
{ 	
	CreateMap 
< 
Teacher 
, 
TeacherModel +
>+ ,
(, -
)- .
.. /

ReverseMap/ 9
(9 :
): ;
;; <
	CreateMap 
< 
	ClassRoom 
,  
ClassRoomModel! /
>/ 0
(0 1
)1 2
.2 3

ReverseMap3 =
(= >
)> ?
;? @
} 	
} 
} �
PD:\aspdotnet\CSharpOPPsRepo\WebApiWithRelationShipOneToManyAssignment\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddDbContext 
< %
DbContextLayerForRelation 7
>7 8
(8 9
option9 ?
=>@ B
optionC I
.I J
UseSqlServerJ V
(V W
builderW ^
.^ _
Configuration_ l
.l m 
GetConnectionString	m �
(
� �
$str
� �
)
� �
??
� �
throw
� �
new
� �'
InvalidOperationException
� �
(
� �
$str
� �
)
� �
)
� �
)
� �
;
� �
builder		 
.		 
Services		 
.		 
AddAutoMapper		 
(		 
typeof		 %
(		% &
Program		& -
)		- .
)		. /
;		/ 0
builder

 
.

 
Services

 
.

 
AddControllers

 
(

  
)

  !
;

! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
app 
. 
Environment 
. 
IsDevelopment !
(! "
)" #
)# $
{ 
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
) 
; 
} 
app 
. 
UseHttpsRedirection 
( 
) 
; 
app 
. 
UseAuthorization 
( 
) 
; 
app 
. 
MapControllers 
( 
) 
; 
app!! 
.!! 
Run!! 
(!! 
)!! 	
;!!	 
