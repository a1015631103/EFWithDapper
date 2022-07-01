using AutoMapper;
using EFWithDapper.DB;
using EFWithDapper.Model.Role;
using EFWithDapper.Model.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFWithDapper.ObjectMapper
{
    public class DemoProfile : Profile
    {
        public DemoProfile()
        {
            CreateMap<AddRoleModel, SysRole>()
                     .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.RoleName))
                     .ForMember(dest => dest.Level, opt => opt.MapFrom(src => src.RoleLevel))
                     .AfterMap((src, dest) => { dest.Enabled = 1; dest.Type = 1; });
            CreateMap<SysRole, RoleInfo>()
                .ForMember(dest => dest.RoleId, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.RoleName, opt => opt.MapFrom(src => src.Name))
                .ForMember(dest => dest.RoleLevel, opt => opt.MapFrom(src => src.Level))
                .ReverseMap();//ReverseMap表示双向互转

            CreateMap<SysUser, SysUserInfo>().ForMember(dest => dest.NickName, opt => opt.MapFrom(src => src.Name));

            CreateMap<RegisterSysUser, SysUser>().ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.NickName))
                                                 .AfterMap((src, dest) =>
                                                 {
                                                     dest.Guid = Guid.NewGuid();
                                                     dest.CreateTime = DateTime.Now; dest.Enabled = 1; dest.IsDelete = 1;
                                                     dest.RegType = 1; dest.Type = 1; dest.Status = 1;
                                                 });
            CreateMap<RegisterSysUser, TbUsersExpand>().AfterMap((src, dest) => { dest.CreateDate = DateTime.Now; });
        }
    }
}
