�
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
TeacherModel 
? 
TeacherModel )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
List 
< 
ClassRoomModel "
>" #
?# $
ClassRoomModelList% 7
{8 9
get: =
;= >
set? B
;B C
}D E
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
 �c
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
 
var(( 
obj(( 
=(( 
_context(( 
.(( 
Teachers(( '
.((' (
Include((( /
(((/ 0
t((0 1
=>((2 4
t((5 6
.((6 7
ClassRoomsList((7 E
)((E F
.((F G
ToList((G M
(((M N
)((N O
;((O P
return)) 
Ok)) 
()) 
obj)) 
))) 
;)) 
}** 	
[-- 	
HttpGet--	 
(-- 
$str-- 
)-- 
]-- 
public.. 
async.. 
Task.. 
<.. 
ActionResult.. &
<..& '
Teacher..' .
>... /
>../ 0

GetTeacher..1 ;
(..; <
int..< ?
id..@ B
)..B C
{// 	
if00
 
(00 
_context00 
.00 
Teachers00 
==00  "
null00# '
)00' (
{11
 
return22 
NotFound22 
(22 
)22 
;22  
}33
 
var44 
teacher44 
=44 
_context44 "
.44" #
Teachers44# +
.44+ ,
Where44, 1
(441 2
t442 3
=>443 5
t445 6
.446 7
	TeacherID447 @
==44A C
id44D F
)44F G
.44G H
Include44H O
(44O P
cls44P S
=>44S U
cls44U X
.44X Y
ClassRoomsList44Y g
)44g h
.44h i
FirstOrDefault44i w
(44w x
)44x y
;44y z
if66 
(66 
teacher66 
==66 
null66 
)66  
{77 
return88 
NotFound88 
(88  
)88  !
;88! "
}99 
return;; 
Ok;; 
(;; 
teacher;; 
);; 
;;; 
}<< 	
[?? 	
HttpPut??	 
(?? 
$str?? 
)?? 
]?? 
public@@ 
async@@ 
Task@@ 
<@@ 
IActionResult@@ '
>@@' (

PutTeacher@@) 3
(@@3 4
int@@4 7
id@@8 :
,@@: ;)
BindingTheTeacherAndClassRoom@@< Y
teacher@@Z a
)@@a b
{AA 	
varCC 
	updateObjCC 
=CC 
_contextCC $
.CC$ %
TeachersCC% -
.CC- .
WhereCC. 3
(CC3 4
tCC4 5
=>CC6 8
tCC9 :
.CC: ;
	TeacherIDCC; D
==CCE G
idCCH J
)CCJ K
.CCK L
IncludeCCL S
(CCS T
cCCT U
=>CCV X
cCCY Z
.CCZ [
ClassRoomsListCC[ i
)CCi j
.CCj k
FirstOrDefaultCCk y
(CCy z
)CCz {
;CC{ |
ifDD 
(DD 
	updateObjDD 
==DD 
nullDD  
)DD  !
{EE 
returnFF 

BadRequestFF !
(FF! "
)FF" #
;FF# $
}GG 
varHH 

teacherObjHH 
=HH 
_mapperHH $
.HH$ %
MapHH% (
<HH( )
TeacherHH) 0
>HH0 1
(HH1 2
teacherHH2 9
.HH9 :
TeacherModelHH: F
)HHF G
;HHG H
ifJJ 
(JJ 
idJJ 
!=JJ 

teacherObjJJ  
.JJ  !
	TeacherIDJJ! *
)JJ* +
{KK 
returnLL 

BadRequestLL !
(LL! "
)LL" #
;LL# $
}MM 
varNN 
classObjNN 
=NN 
_mapperNN "
.NN" #
MapNN# &
<NN& '
ListNN' +
<NN+ ,
	ClassRoomNN, 5
>NN5 6
>NN6 7
(NN7 8
teacherNN8 ?
.NN? @
ClassRoomModelListNN@ R
)NNR S
;NNS T
	updateObjPP 
.PP 
AddressPP 
=PP 

teacherObjPP  *
.PP* +
AddressPP+ 2
;PP2 3
	updateObjQQ 
.QQ 
TeacherNameQQ !
=QQ! "

teacherObjQQ# -
.QQ- .
TeacherNameQQ. 9
;QQ9 :
	updateObjSS 
.SS 
ClassRoomsListSS $
=SS$ %
classObjSS& .
;SS. /
_contextUU 
.UU 
UpdateUU 
(UU 
	updateObjUU %
)UU% &
;UU& '
tryXX 
{YY 
awaitZZ 
_contextZZ 
.ZZ 
SaveChangesAsyncZZ /
(ZZ/ 0
)ZZ0 1
;ZZ1 2
}[[ 
catch\\ 
(\\ (
DbUpdateConcurrencyException\\ /
)\\/ 0
{]] 
if^^ 
(^^ 
!^^ 
TeacherExists^^ "
(^^" #
id^^# %
)^^% &
)^^& '
{__ 
return`` 
NotFound`` #
(``# $
)``$ %
;``% &
}aa 
elsebb 
{cc 
throwdd 
;dd 
}ee 
}ff 
returnhh 
	NoContenthh 
(hh 
)hh 
;hh 
}ii 	
[ll 	
HttpPostll	 
]ll 
publicmm 
asyncmm 
Taskmm 
<mm 
ActionResultmm &
<mm& '
Teachermm' .
>mm. /
>mm/ 0
PostTeachermm1 <
(mm< =)
BindingTheTeacherAndClassRoommm= Z
getInfomm[ b
)mmb c
{nn 	
ifoo
 
(oo 
_contextoo 
.oo 
Teachersoo 
==oo  "
nulloo# '
)oo' (
{pp
 
returnqq 
Problemqq 
(qq 
$strqq X
)qqX Y
;qqY Z
}rr
 
varss 

teacherobjss 
=ss 
_mapperss #
.ss# $
Mapss$ '
<ss' (
Teacherss( /
>ss/ 0
(ss0 1
getInfoss1 8
.ss8 9
TeacherModelss9 E
)ssE F
;ssF G
vartt 
classroomListtt 
=tt 
_mappertt  '
.tt' (
Maptt( +
<tt+ ,
Listtt, 0
<tt0 1
	ClassRoomtt1 :
>tt: ;
>tt; <
(tt< =
getInfott= D
.ttD E
ClassRoomModelListttE W
)ttW X
;ttX Y

teacherobjuu 
.uu 
ClassRoomsListuu %
=uu& '
classroomListuu( 5
;uu5 6
_contextvv 
.vv 
Teachersvv 
.vv 
Addvv "
(vv" #

teacherobjvv# -
)vv- .
;vv. /
awaitww 
_contextww 
.ww 
SaveChangesAsyncww +
(ww+ ,
)ww, -
;ww- .
returnyy 
Okyy 
(yy 
$stryy 
)yy 
;yy 
}zz 	
[}} 	

HttpDelete}}	 
(}} 
$str}} 
)}} 
]}} 
public~~ 
async~~ 
Task~~ 
<~~ 
IActionResult~~ '
>~~' (
DeleteTeacher~~) 6
(~~6 7
int~~7 :
id~~; =
)~~= >
{ 	
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
�� 
teacherDelete
�� 
=
�� 
await
��! &
_context
��' /
.
��/ 0
Teachers
��0 8
.
��8 9
	FindAsync
��9 B
(
��B C
id
��C E
)
��E F
;
��F G
if
�� 
(
�� 
teacherDelete
�� 
==
��  
null
��! %
)
��% &
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
��$ %
teacherDelete
��% 2
)
��2 3
;
��3 4
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
�� 	
[
�� 	
	HttpPatch
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
PatchTeacher
��( 4
(
��4 5
string
��5 ;
Name
��< @
,
��@ A
string
��A G
Address
��H O
,
��O P
int
��P S
id
��T V
)
��V W
{
�� 	
var
�� )
teacherNameAndAddressUpdate
�� +
=
��, -
_context
��. 6
.
��6 7
Teachers
��7 ?
.
��? @
Where
��@ E
(
��E F
t
��F G
=>
��H J
t
��K L
.
��L M
	TeacherID
��M V
==
��W Y
id
��Z \
)
��\ ]
.
��] ^
FirstOrDefault
��^ l
(
��l m
)
��m n
;
��n o
if
�� 
(
�� )
teacherNameAndAddressUpdate
�� *
==
��+ -
null
��. 2
)
��2 3
{
�� 
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
}
�� )
teacherNameAndAddressUpdate
�� '
.
��' (
TeacherName
��( 3
=
��4 5
Name
��6 :
;
��: ;)
teacherNameAndAddressUpdate
�� '
.
��' (
Address
��( /
=
��0 1
Address
��2 9
;
��9 :
_context
�� 
.
�� 
Update
�� 
(
�� )
teacherNameAndAddressUpdate
�� 7
)
��7 8
;
��8 9
await
��
 
_context
�� 
.
�� 
SaveChangesAsync
�� *
(
��* +
)
��+ ,
;
��, -
return
�� 
Ok
�� 
(
�� 
$str
�� "
)
��" #
;
��# $
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
	namespace 	5
)WebApiWithRelationShipOneToManyAssignment
 3
.3 4
Mapper4 :
{ 
public 

class 
MapperProfile 
: 
Profile &
{		 
public

 
MapperProfile

 
(

 
)

 
{ 	
	CreateMap 
< 
Teacher 
, 
TeacherModel +
>+ ,
(, -
)- .
.. /

ReverseMap/ 9
(9 :
): ;
;; <
	CreateMap 
< 
	ClassRoom 
,  
ClassRoomModel! /
>/ 0
(0 1
)1 2
.2 3

ReverseMap3 =
(= >
)> ?
;? @
} 	
} 
} �
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
. 
AddJsonOptions 
( 
options 
=> 
options &
.& '!
JsonSerializerOptions' <
.< =
ReferenceHandler= M
=N O
ReferenceHandlerP `
.` a
IgnoreCyclesa m
)m n
;n o
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
app 
. 
Environment 
. 
IsDevelopment !
(! "
)" #
)# $
{ 
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
) 
; 
} 
app 
. 
UseHttpsRedirection 
( 
) 
; 
app 
. 
UseAuthorization 
( 
) 
; 
app   
.   
MapControllers   
(   
)   
;   
app"" 
."" 
Run"" 
("" 
)"" 	
;""	 
