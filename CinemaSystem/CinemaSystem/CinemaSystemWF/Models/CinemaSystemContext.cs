﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace CinemaSystemWF.Models
{
    public partial class CinemaSystemContext : DbContext
    {
        public CinemaSystemContext()
        {
        }

        public CinemaSystemContext(DbContextOptions<CinemaSystemContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Film> Films { get; set; }
        public virtual DbSet<Room> Rooms { get; set; }
        public virtual DbSet<Show> Shows { get; set; }
        public virtual DbSet<Ticket> Tickets { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=LAPTOP-JDLKA9VR\\SQLEXPRESS05;Database=CinemaSystem;User Id=sa;Password=123");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Desc)
                    .IsRequired()
                    .HasMaxLength(1024);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(64);
            });

            modelBuilder.Entity<Film>(entity =>
            {
                entity.ToTable("Film");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Desc)
                    .IsRequired()
                    .HasMaxLength(1024);

                entity.Property(e => e.ImageUrl)
                    .IsRequired()
                    .HasMaxLength(128)
                    .HasColumnName("ImageURL");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(64);

                entity.Property(e => e.ReleaseDate).HasColumnType("date");

                entity.HasMany(d => d.Categories)
                    .WithMany(p => p.Films)
                    .UsingEntity<Dictionary<string, object>>(
                        "FilmCategory",
                        l => l.HasOne<Category>().WithMany().HasForeignKey("CategoryId").HasConstraintName("FK__FilmCateg__Categ__46E78A0C"),
                        r => r.HasOne<Film>().WithMany().HasForeignKey("FilmId").HasConstraintName("FK__FilmCateg__FilmI__47DBAE45"),
                        j =>
                        {
                            j.HasKey("FilmId", "CategoryId").HasName("PK__FilmCate__CC8DB13E7F440128");

                            j.ToTable("FilmCategory");

                            j.IndexerProperty<int>("FilmId").HasColumnName("FilmID");

                            j.IndexerProperty<int>("CategoryId").HasColumnName("CategoryID");
                        });
            });

            modelBuilder.Entity<Room>(entity =>
            {
                entity.ToTable("Room");

                entity.HasIndex(e => e.Name, "UQ__Room__737584F607485082")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(64);
            });

            modelBuilder.Entity<Show>(entity =>
            {
                entity.ToTable("Show");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.End).HasColumnType("datetime");

                entity.Property(e => e.FilmId).HasColumnName("FilmID");

                entity.Property(e => e.RoomId).HasColumnName("RoomID");

                entity.Property(e => e.Start).HasColumnType("datetime");

                entity.HasOne(d => d.Film)
                    .WithMany(p => p.Shows)
                    .HasForeignKey(d => d.FilmId)
                    .HasConstraintName("FK__Show__FilmID__48CFD27E");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.Shows)
                    .HasForeignKey(d => d.RoomId)
                    .HasConstraintName("FK__Show__RoomID__49C3F6B7");
            });

            modelBuilder.Entity<Ticket>(entity =>
            {
                entity.HasKey(e => new { e.ShowId, e.Row, e.Col })
                    .HasName("PK__Ticket__C18D1EE859CF5996");

                entity.ToTable("Ticket");

                entity.Property(e => e.ShowId).HasColumnName("ShowID");

                entity.Property(e => e.Otp)
                    .IsRequired()
                    .HasMaxLength(6)
                    .IsUnicode(false)
                    .HasColumnName("OTP")
                    .IsFixedLength();

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Show)
                    .WithMany(p => p.Tickets)
                    .HasForeignKey(d => d.ShowId)
                    .HasConstraintName("FK__Ticket__ShowID__4AB81AF0");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Tickets)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK__Ticket__UserID__4BAC3F29");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.HasIndex(e => e.Email, "UQ__User__A9D10534B9F4A4A0")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AvatarUrl)
                    .IsRequired()
                    .HasMaxLength(128)
                    .HasColumnName("AvatarURL");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(64);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(64);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(64);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
