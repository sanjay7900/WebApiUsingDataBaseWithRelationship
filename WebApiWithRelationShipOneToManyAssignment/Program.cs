using Microsoft.EntityFrameworkCore;
using System.Text.Json.Serialization;
using WebApiDbLayerWithRelationShip;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddDbContext<DbContextLayerForRelation>(option => option.UseSqlServer(builder.Configuration.GetConnectionString("Connection")?? throw new InvalidOperationException(" Connection String Not Found")));
builder.Services.AddAutoMapper(typeof(Program));
builder.Services.AddControllers();
//builder.Services.AddControllersWithViews()
//    .AddJsonOptions(options => options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
