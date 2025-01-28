using Microsoft.AspNetCore.Authentication.Cookies;
using ProyectoVenta.Datos;
using ProyectoVenta.Repository;
using ProyectoVenta.Services;

var builder = WebApplication.CreateBuilder(args);

// Services.
builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages().AddRazorRuntimeCompilation();

// Repository.
builder.Services.AddScoped<IUsuarioRepository, UsuarioRepository>();
builder.Services.AddScoped<ICategoriaRepository, CategoriaRepository>();
builder.Services.AddScoped<IProductoRepository, ProductoRepository>();
builder.Services.AddScoped<IReporteRepository, ReporteRepository>();
builder.Services.AddScoped<IVentaRepository, VentaRepository>();

// USAR AUTORIZACION
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(option => {
        option.LoginPath = "/Acceso/Index";
    });

// USAR SESION
builder.Services.AddSession();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}

// USAR AUTORIZACION
app.UseAuthentication();

// USAR SESION
app.UseSession();

app.UseStaticFiles();

app.UseRouting();

// USAR AUTORIZACION
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Acceso}/{action=Index}/{id?}");

app.Run();

