using Autofac;
using System.Reflection;

namespace EFWithDapper
{
    public class EFWithDapperAutofacModule : Autofac.Module
    {


        protected override void Load(ContainerBuilder containerBuilder)
        {
            //直接注册某一个类和接口
            //左边的是实现类，右边的As是接口
            //containerBuilder.RegisterType<BaseRepository>().As<IBaseRepository>().SingleInstance();

            #region 使用 LoadFile 加载程序集

            //获取项目路径
            var basePath = AppContext.BaseDirectory;
            var ServicesDllFile = Path.Combine(basePath, "EFWithDapper.Services.dll");//获取注入项目绝对路径
            var assemblysServices = Assembly.LoadFile(ServicesDllFile);//直接采用加载文件的方法
            containerBuilder.RegisterAssemblyTypes(assemblysServices).AsImplementedInterfaces().InstancePerLifetimeScope();

            #endregion
        }
    }
}
