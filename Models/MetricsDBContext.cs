using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace MetricsApp.Models
{
    public partial class MetricsDBContext : DbContext
    {
        public MetricsDBContext()
        {
        }

        public MetricsDBContext(DbContextOptions<MetricsDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ConversionUnit> ConversionUnits { get; set; }
        public virtual DbSet<Quantity> Quantities { get; set; }
        public virtual DbSet<Unit> Units { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("server=MUM02L8981;Initial Catalog=MetricsDB;Trusted_Connection=False;user=sa;password=Password123;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<ConversionUnit>(entity =>
            {
                entity.Property(e => e.ConversionRate).HasColumnType("decimal(18, 5)");
            });

            modelBuilder.Entity<Quantity>(entity =>
            {
                entity.ToTable("Quantity");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Unit>(entity =>
            {
                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Symbol)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
