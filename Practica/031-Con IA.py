import sqlite3
import tkinter as tk
from tkinter import ttk, messagebox

# ---------- Base de datos ----------
conexion = sqlite3.connect("empresa.db")
cursor = conexion.cursor()
cursor.execute("""
CREATE TABLE IF NOT EXISTS clientes (
    Identificador INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Apellidos TEXT NOT NULL,
    Email TEXT NOT NULL
)
""")
conexion.commit()

# ---------- Funciones ----------
def actualizar_tabla():
    for row in tree.get_children():
        tree.delete(row)
    cursor.execute("SELECT * FROM clientes")
    filas = cursor.fetchall()
    for i, cliente in enumerate(filas):
        # Zebra: alternamos colores de fondo
        bg = "#f0f0f0" if i%2==0 else "#ffffff"
        tree.insert("", "end", values=cliente, tags=('zebra',))
        tree.tag_configure('zebra', background=bg)
    total_var.set(f"🌟 Total clientes: {len(filas)}")

def agregar_cliente():
    def guardar():
        n = nombre.get().strip()
        a = apellidos.get().strip()
        e = email.get().strip()
        if n and a and e:
            cursor.execute("INSERT INTO clientes VALUES(NULL, ?, ?, ?)", (n, a, e))
            conexion.commit()
            actualizar_tabla()
            ventana.destroy()
        else:
            messagebox.showwarning("Atención", "Todos los campos son obligatorios")
    
    ventana = tk.Toplevel(root)
    ventana.title("Agregar cliente")
    ventana.geometry("400x200")
    ventana.resizable(False, False)
    ventana.grab_set()
    
    tk.Label(ventana, text="Nombre:").grid(row=0, column=0, padx=15, pady=10, sticky="e")
    tk.Label(ventana, text="Apellidos:").grid(row=1, column=0, padx=15, pady=10, sticky="e")
    tk.Label(ventana, text="Email:").grid(row=2, column=0, padx=15, pady=10, sticky="e")
    
    nombre = tk.Entry(ventana, width=30)
    apellidos = tk.Entry(ventana, width=30)
    email = tk.Entry(ventana, width=30)
    
    nombre.grid(row=0, column=1, padx=10, pady=10)
    apellidos.grid(row=1, column=1, padx=10, pady=10)
    email.grid(row=2, column=1, padx=10, pady=10)
    
    btn = tk.Button(ventana, text="Guardar", bg="#4CAF50", fg="white", width=15, command=guardar)
    btn.grid(row=3, column=0, columnspan=2, pady=15)

def actualizar_cliente():
    item = tree.selection()
    if not item:
        messagebox.showwarning("Atención", "Selecciona un cliente primero")
        return
    ident, n, a, e = tree.item(item)["values"]
    
    def guardar():
        nn = nombre.get().strip()
        aa = apellidos.get().strip()
        ee = email.get().strip()
        if nn and aa and ee:
            cursor.execute("UPDATE clientes SET Nombre=?, Apellidos=?, Email=? WHERE Identificador=?",
                           (nn, aa, ee, ident))
            conexion.commit()
            actualizar_tabla()
            ventana.destroy()
        else:
            messagebox.showwarning("Atención", "Todos los campos son obligatorios")
    
    ventana = tk.Toplevel(root)
    ventana.title("Actualizar cliente")
    ventana.geometry("400x200")
    ventana.resizable(False, False)
    ventana.grab_set()
    
    tk.Label(ventana, text="Nombre:").grid(row=0, column=0, padx=15, pady=10, sticky="e")
    tk.Label(ventana, text="Apellidos:").grid(row=1, column=0, padx=15, pady=10, sticky="e")
    tk.Label(ventana, text="Email:").grid(row=2, column=0, padx=15, pady=10, sticky="e")
    
    nombre = tk.Entry(ventana, width=30); nombre.insert(0, n)
    apellidos = tk.Entry(ventana, width=30); apellidos.insert(0, a)
    email = tk.Entry(ventana, width=30); email.insert(0, e)
    
    nombre.grid(row=0, column=1, padx=10, pady=10)
    apellidos.grid(row=1, column=1, padx=10, pady=10)
    email.grid(row=2, column=1, padx=10, pady=10)
    
    btn = tk.Button(ventana, text="Guardar cambios", bg="#2196F3", fg="white", width=15, command=guardar)
    btn.grid(row=3, column=0, columnspan=2, pady=15)

def eliminar_cliente():
    item = tree.selection()
    if not item:
        messagebox.showwarning("Atención", "Selecciona un cliente primero")
        return
    ident = tree.item(item)["values"][0]
    if messagebox.askyesno("Confirmar eliminación", "¿Seguro que quieres eliminar este cliente?"):
        cursor.execute("DELETE FROM clientes WHERE Identificador=?", (ident,))
        conexion.commit()
        actualizar_tabla()

# ---------- Interfaz ----------
root = tk.Tk()
root.title("Agenda SQLite - Daniel Oliveira")
root.geometry("850x500")
root.resizable(True, True)

# Dashboard / contador
total_var = tk.StringVar()
total_label = tk.Label(root, textvariable=total_var, font=("Arial", 14, "bold"), fg="#FF5722")
total_label.pack(pady=10)

# Tabla de clientes
cols = ("ID", "Nombre", "Apellidos", "Email")
tree = ttk.Treeview(root, columns=cols, show="headings")
for c in cols:
    tree.heading(c, text=c)
    if c=="ID":
        tree.column(c, width=50, anchor="center")
    elif c=="Email":
        tree.column(c, width=200, anchor="e")
    else:
        tree.column(c, width=200, anchor="w")
tree.pack(fill="both", expand=True, padx=15, pady=10)

# Scroll vertical
scroll = ttk.Scrollbar(root, orient="vertical", command=tree.yview)
tree.configure(yscrollcommand=scroll.set)
scroll.pack(side="right", fill="y")

# Botones
frame = tk.Frame(root)
frame.pack(pady=10)
btn_agregar = tk.Button(frame, text="Agregar", bg="#4CAF50", fg="white", width=15, command=agregar_cliente)
btn_agregar.pack(side="left", padx=10)
btn_actualizar = tk.Button(frame, text="Actualizar", bg="#2196F3", fg="white", width=15, command=actualizar_cliente)
btn_actualizar.pack(side="left", padx=10)
btn_eliminar = tk.Button(frame, text="Eliminar", bg="#f44336", fg="white", width=15, command=eliminar_cliente)
btn_eliminar.pack(side="left", padx=10)

# Inicializar tabla
actualizar_tabla()
root.mainloop()
conexion.close()
