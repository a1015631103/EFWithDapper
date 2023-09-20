using AutoMapper;
using AutoMapper.QueryableExtensions;
using Dapper;
using EFWithDapper.DB;
using EFWithDapper.IServices;
using EFWithDapper.Model;
using EFWithDapper.Model.User;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using LinqKit;
using DapperQueryBuilder;
using Microsoft.EntityFrameworkCore.Storage;
using EFWithDapper.Model.Role;

namespace EFWithDapper.Services
{
    public class Demo02Services : IDemo02Services
    {
        private DemoDbContext dbContext;
        private IMapper mapper;
        public Demo02Services(DemoDbContext dbContext, IMapper mapper)
        {
            this.dbContext = dbContext;
            this.mapper = mapper;
        }

        /// <summary>
        /// 使用linq to ef 动态查询（linqKit扩展）单表分页
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public async Task<ResultData<List<SysUserInfo>>> QuerySysUserInfoListByPageAsync(SysUserInfoParam param)
        {
            ResultData<List<SysUserInfo>> result = new ResultData<List<SysUserInfo>>();
            var whereExp = PredicateBuilder.New<SysUser>(true);

            if (!string.IsNullOrWhiteSpace(param.LoginName))
            {
                whereExp = whereExp.And(t => t.LoginName.Contains(param.LoginName));
            }
            if (!string.IsNullOrWhiteSpace(param.NickName))
            {
                whereExp = whereExp.And(t => t.Name.Contains(param.NickName));
            }
            if (param.Enabled > 0)
            {
                whereExp = whereExp.And(p => p.Enabled == param.Enabled);
            }
            if (!string.IsNullOrWhiteSpace(param.CreateTime))
            {
                whereExp = whereExp.And(t => t.CreateTime > Convert.ToDateTime(param.CreateTime));
            }
            if (!string.IsNullOrWhiteSpace(param.RegEmail))
            {
                whereExp = whereExp.And(t => t.RegEmail.Equals(param.RegEmail));
            }
            if (!string.IsNullOrWhiteSpace(param.RegPhone))
            {
                whereExp = whereExp.And(t => t.RegPhone.Equals(param.RegPhone));
            }

            int total = await dbContext.SysUsers.AsNoTracking().Where(whereExp).CountAsync();
            var list = await dbContext.SysUsers.AsNoTracking().OrderByDescending(t => t.CreateTime).Where(whereExp)
                .Skip((param.PageIndex - 1) * param.PageSize).Take(param.PageSize).ProjectTo<SysUserInfo>(mapper.ConfigurationProvider)
                .ToListAsync();
            if (list.Count > 0)
            {
                result.Tag = 1;
                result.Message = "获取成功";
                result.Data = list;
                result.Total = total;
            }
            return result;

        }

        /// <summary>
        /// 使用Dapper查询2张表内联分页
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public async Task<ResultData<List<UserInfo>>> QueryUserInfoListByPageAsync(UserInfoParam param)
        {
            ResultData<List<UserInfo>> result = new ResultData<List<UserInfo>>();

            var dbConnection = dbContext.Database.GetDbConnection();
            var query = dbConnection.QueryBuilder($@"SELECT COUNT(*)
FROM sys_User AS u INNER JOIN tb_UsersExpand AS ue ON u.Guid = ue.SysUserId /**where**/;
SELECT u.Guid,u.LoginName,u.Name AS NickName,u.Enabled,u.CreateTime,
u.RegEmail, u.RegPhone, ue.Sex, ue.EducationBackground, ue.Employment
FROM sys_User AS u INNER JOIN tb_UsersExpand AS ue ON u.Guid = ue.SysUserId /**where**/ ORDER BY u.CreateTime DESC OFFSET {(param.PageIndex - 1) * param.PageSize} ROWS
FETCH NEXT {param.PageSize} ROWS ONLY");

            /*可以参考这个库：https://github.com/Drizin/DapperQueryBuilder
              以下的拼接只是库做了封装的语法糖，查询的sql仍然是参数化查询
             */
            query.Where($"u.IsDelete=2");
            if (!string.IsNullOrWhiteSpace(param.LoginName))
            {
                query.Where($"u.LoginName={param.LoginName}");
            }
            if (param.Enabled > 0)
            {
                query.Where($"u.Enabled={param.Enabled}");
            }
            if (param.Sex > 0)
            {
                query.Where($"ue.Sex={param.Sex}");
            }

            var orFilters = new Filters(Filters.FiltersType.OR);
            if (param.EducationBackground > 0)
            {
                orFilters.Add(new Filter($"ue.EducationBackground>{param.EducationBackground}"));
            }
            if (param.Employment > 0)
            {
                orFilters.Add(new Filter($"ue.Employment ={param.Employment}"));
            }
            if (orFilters.Count > 0)
            {
                query.Where(orFilters);
            }
            var queryResult = await query.QueryMultipleAsync();
            int total = await queryResult.ReadFirstAsync<int>();
            List<UserInfo> list = (await queryResult.ReadAsync<UserInfo>()).ToList(); ;

            if (list.Count > 0)
            {
                result.Tag = 1;
                result.Message = "获取成功";
                result.Data = list;
                result.Total = total;
            }
            return result;
        }

        /// <summary>
        /// sql注入测试（因为参数化查询，所以返回总数为0）
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public async Task<ResultData<int>> SqlInjectionTestAsync(string loginName, string pwd)
        {
            ResultData<int> result = new ResultData<int>();

            var dbConnection = dbContext.Database.GetDbConnection();
            var query = dbConnection.QueryBuilder($@"SELECT COUNT(*)  FROM sys_User WHERE LoginName={loginName} AND Password={pwd}");

            var count = await query.QueryFirstAsync<int>();
            if (count > 0)
            {
                result.Tag = 1;
                result.Data = count;
            }
            return result;
        }

        /// <summary>
        ///  获取角色所属用户总数
        /// </summary>
        /// <returns></returns>
        public async Task<ResultData<List<RoleByUserCount>>> GetRoleByUserCountListAsync()
        {
            ResultData<List<RoleByUserCount>> result = new ResultData<List<RoleByUserCount>>();
            var dbConnection = dbContext.Database.GetDbConnection();
            var query = dbConnection.QueryBuilder($@"SELECT ru.RoleId, r.Name AS RoleName, UserCount FROM(select RoleId, COUNT(*) AS UserCount
FROM sys_RoleInUser
GROUP BY RoleId
HAVING RoleId > 3 AND COUNT(*)>1 ) AS ru
INNER JOIN sys_Role AS r ON ru.RoleId = r.Id");

            var list = (await query.QueryAsync<RoleByUserCount>()).ToList();
            if (list.Count > 0)
            {
                result.Tag = 1;
                result.Message = "获取成功";
                result.Data = list;
            }
            return result;
        }

    }
}
