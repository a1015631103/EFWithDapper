using Autofac;
using Autofac.Extensions.DependencyInjection;
using EFWithDapper;
using EFWithDapper.DB;
using EFWithDapper.ObjectMapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using System.Reflection;

var builder = WebApplication.CreateBuilder(args);
// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    var xmlPath = Path.Combine(AppContext.BaseDirectory, $"{Assembly.GetExecutingAssembly().GetName().Name}.xml");
    options.SwaggerDoc("v1", new OpenApiInfo { Title = "EFWithDapper", Version = "v1" });
    options.IncludeXmlComments(xmlPath, true);
});

//Add Autofac
builder.Host.UseServiceProviderFactory(new AutofacServiceProviderFactory());
builder.Host.ConfigureContainer<ContainerBuilder>(builder => builder.RegisterModule(new EFWithDapperAutofacModule()));

//Add EF Core 
builder.Services.AddDbContext<DemoDbContext>(
        options => options.UseSqlServer("name=ConnectionStrings:DefaultConnection", o => o.MinBatchSize(2).MaxBatchSize(5))
    //观察sql生成包括参数值，线上环境注意关闭
    .UseLoggerFactory(LoggerFactory.Create(builder =>
    {
        builder.AddConsole().AddDebug();
    }))
    .EnableSensitiveDataLogging());


//Add AutoMapper
builder.Services.AddAutoMapper(typeof(DemoProfile).Assembly);


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
