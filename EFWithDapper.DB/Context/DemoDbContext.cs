using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace EFWithDapper.DB
{
    public partial class DemoDbContext : DbContext
    {
        public DemoDbContext()
        {
        }

        public DemoDbContext(DbContextOptions<DemoDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<SysRole> SysRoles { get; set; } = null!;
        public virtual DbSet<SysRoleInUser> SysRoleInUsers { get; set; } = null!;
        public virtual DbSet<SysUser> SysUsers { get; set; } = null!;
        public virtual DbSet<TbUsersExpand> TbUsersExpands { get; set; } = null!;


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SysRole>(entity =>
            {
                entity.ToTable("sys_Role");

                entity.Property(e => e.Id).HasComment("角色表");

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .HasComment("描述");

                entity.Property(e => e.Enabled).HasComment("禁用/启用");

                entity.Property(e => e.Level).HasComment("等级");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasComment("角色名称");

                entity.Property(e => e.Type).HasComment("类型");
            });

            modelBuilder.Entity<SysRoleInUser>(entity =>
            {
                entity.ToTable("sys_RoleInUser");

                entity.Property(e => e.Id).HasComment("用户角色表");

                entity.Property(e => e.RoleId).HasComment("角色表Id");

                entity.Property(e => e.UserGuid).HasComment("用户表Id");
            });

            modelBuilder.Entity<SysUser>(entity =>
            {
                entity.HasKey(e => e.Guid);

                entity.ToTable("sys_User");

                entity.Property(e => e.Guid)
                    .ValueGeneratedNever()
                    .HasComment("用户表");

                entity.Property(e => e.CreateTime)
                    .HasColumnType("datetime")
                    .HasComment("创建时间");

                entity.Property(e => e.Enabled).HasComment("禁用/启用，1代表启用，2代表禁用");

                entity.Property(e => e.IsDelete)
                    .HasDefaultValueSql("((2))")
                    .HasComment("1代表已经删除，2代表没有删除");

                entity.Property(e => e.LoginName)
                    .HasMaxLength(255)
                    .HasComment("登录名");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasComment("昵称");

                entity.Property(e => e.Password)
                    .HasMaxLength(255)
                    .HasComment("密码");

                entity.Property(e => e.RegEmail)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasComment("注册邮箱");

                entity.Property(e => e.RegPhone)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasComment("注册手机");

                entity.Property(e => e.RegType).HasComment("1代表前台注册，2代表后台添加");

                entity.Property(e => e.Status).HasComment("状态,默认设置为1");

                entity.Property(e => e.Type).HasComment("类型 0代表超级管理员，1代表其他用户");
            });

            modelBuilder.Entity<TbUsersExpand>(entity =>
            {
                entity.ToTable("tb_UsersExpand");

                entity.HasComment("用户扩展表");

                entity.Property(e => e.BorthDay)
                    .HasColumnType("datetime")
                    .HasComment("生日");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasComment("创建时间");

                entity.Property(e => e.EducationBackground).HasComment("1代表小学2代表初中，3代表高中，4代表大专5代表本科，6代表硕士研究生，7代表博士研究生以上");

                entity.Property(e => e.Employment).HasComment("1代表学生，2代表在职");

                entity.Property(e => e.LastDate)
                    .HasColumnType("datetime")
                    .HasComment("最近登录时间");

                entity.Property(e => e.LastIp)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("LastIP")
                    .HasComment("最近登录IP");

                entity.Property(e => e.PersonPhotoPath).HasMaxLength(1000);

                entity.Property(e => e.Remark)
                    .HasMaxLength(100)
                    .HasComment("备注");

                entity.Property(e => e.Sex).HasComment("1代表男，2代表女，3代表保密");

                entity.Property(e => e.SysUserId).HasComment("关联后台系统用户表ID");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
