using System;
using System.Collections.Generic;
using Gconnect.Domain.Entities;
using Microsoft.AspNetCore.Identity;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using project231.Authenticate;
using project231.Models;

namespace project231_2.Models
{
    public class Project231Context : DbContext
    {
        public Project231Context()
        {
        }

        public Project231Context(DbContextOptions<Project231Context> options)
            : base(options)
        {
        }

        public  DbSet<AspNetRole> AspNetRoles { get; set; }
        public DbSet<AspNetUserRole> AspNetUserRoles => Set<AspNetUserRole>();

        public  DbSet<AspNetRoleClaim> AspNetRoleClaims { get; set; }

        public  DbSet<AspNetUser> AspNetUsers { get; set; }

        public  DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }

        public  DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }

        public  DbSet<AspNetUserToken> AspNetUserTokens { get; set; }

        public  DbSet<Category> Categories { get; set; }

        public  DbSet<Inventory> Inventories { get; set; }

        public  DbSet<Order> Orders { get; set; }

        public  DbSet<OrderItem> OrderItems { get; set; }

        public  DbSet<Product> Products { get; set; }

        public  DbSet<Supplier> Suppliers { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            

        }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<AspNetRole>(entity =>
            {
                entity.HasIndex(e => e.NormalizedName, "RoleNameIndex")
                    .IsUnique()
                    .HasFilter("([NormalizedName] IS NOT NULL)");

                entity.Property(e => e.Name).HasMaxLength(256);
                entity.Property(e => e.NormalizedName).HasMaxLength(256);
            });

            modelBuilder.Entity<AspNetRoleClaim>(entity =>
            {
                entity.HasIndex(e => e.RoleId, "IX_AspNetRoleClaims_RoleId");

                entity.HasOne(d => d.Role).WithMany(p => p.AspNetRoleClaims).HasForeignKey(d => d.RoleId);
            });

            modelBuilder.Entity<AspNetUser>(entity =>
            {
                entity.HasIndex(e => e.NormalizedEmail, "EmailIndex");

                entity.HasIndex(e => e.NormalizedUserName, "UserNameIndex")
                    .IsUnique()
                    .HasFilter("([NormalizedUserName] IS NOT NULL)");

                entity.Property(e => e.Email).HasMaxLength(256);
                entity.Property(e => e.NormalizedEmail).HasMaxLength(256);
                entity.Property(e => e.NormalizedUserName).HasMaxLength(256);
                entity.Property(e => e.UserName).HasMaxLength(256);

              
            });
            modelBuilder.Entity<AspNetUserRole>(entity =>
            {
                entity.HasKey(e => e.Id).HasName("Id");

                entity.HasIndex(e => e.RoleId, "RoleId");
                entity.HasIndex(e => e.UserId, "UserId");

               



                entity.HasOne(d => d.Role).WithMany(p => p.AspNetUserRoles).HasForeignKey(d => d.RoleId);

                entity.HasOne(d => d.User).WithMany(p => p.AspNetUserRoles).HasForeignKey(d => d.UserId);
            });


            modelBuilder.Entity<AspNetUserClaim>(entity =>
            {
                entity.HasIndex(e => e.UserId, "IX_AspNetUserClaims_UserId");

                entity.HasOne(d => d.User).WithMany(p => p.AspNetUserClaims).HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserLogin>(entity =>
            {
                entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

                entity.HasIndex(e => e.UserId, "IX_AspNetUserLogins_UserId");

                entity.HasOne(d => d.User).WithMany(p => p.AspNetUserLogins).HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<AspNetUserToken>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

                entity.HasOne(d => d.User).WithMany(p => p.AspNetUserTokens).HasForeignKey(d => d.UserId);
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasColumnName("name");
            });

            modelBuilder.Entity<Inventory>(entity =>
            {
                entity.ToTable("Inventory");

                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.Quantity).HasColumnName("quantity");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.HasIndex(e => e.UserId, "IX_Orders_user_id");

                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.OrderDate)
                    .HasColumnType("date")
                    .HasColumnName("order_date");
                entity.Property(e => e.Status).HasColumnName("status");
                entity.Property(e => e.TotalAmout).HasColumnName("total_amout");
                entity.Property(e => e.UserId).HasColumnName("user_id");
                entity.HasOne(d=>d.AspNetUsers).WithMany(p=>p.Orders).HasForeignKey(e => e.UserId); 
            });

            modelBuilder.Entity<OrderItem>(entity =>
            {
                entity.ToTable("Order_Item");

                entity.HasIndex(e => e.OrdersId, "IX_Order_Item_orders_id");

                entity.HasIndex(e => e.ProductId, "IX_Order_Item_product_id");

                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.OrdersId).HasColumnName("orders_id");
                entity.Property(e => e.PricePerItem).HasColumnName("price_per_item");
                entity.Property(e => e.ProductId).HasColumnName("product_id");
                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.HasOne(d => d.Orders).WithMany(p => p.OrderItems)
                    .HasForeignKey(d => d.OrdersId)
                    .HasConstraintName("FK_Order_Item_Orders");

                entity.HasOne(d => d.Product).WithMany(p => p.OrderItems)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_Order_Item_Product");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product");

                entity.HasIndex(e => e.CategoryId, "IX_Product_category_id");

                entity.HasIndex(e => e.SupplierId, "IX_Product_supplier_id");

                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.CategoryId).HasColumnName("category_id");
                entity.Property(e => e.Date).HasColumnType("date");
                entity.Property(e => e.Description)
                    .HasMaxLength(100)
                    .HasColumnName("description");
                entity.Property(e => e.Image)
                    .HasMaxLength(100)
                    .HasColumnName("image");
                entity.Property(e => e.InventoryId).HasColumnName("inventory_id");
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasColumnName("name");
                entity.Property(e => e.Price).HasColumnName("price");
                entity.Property(e => e.ProductCode).HasMaxLength(50);
                entity.Property(e => e.QuantityInStock).HasColumnName("quantity_in_stock");
                entity.Property(e => e.Status).HasColumnName("status");
                entity.Property(e => e.SupplierId).HasColumnName("supplier_id");

                entity.HasOne(d => d.Category).WithMany(p => p.Products)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_Product_Category");

                entity.HasOne(d => d.Supplier).WithMany(p => p.Products)
                    .HasForeignKey(d => d.SupplierId)
                    .HasConstraintName("FK_Product_Suppliers");
            });

            modelBuilder.Entity<Supplier>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.Address)
                    .HasMaxLength(50)
                    .HasColumnName("address");
                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .HasColumnName("email");
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasColumnName("name");
                entity.Property(e => e.Phone)
                    .HasMaxLength(50)
                    .HasColumnName("phone");
            });
            


        }


        
    }
}
